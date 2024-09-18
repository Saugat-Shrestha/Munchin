import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopProfile extends StatefulWidget {
  const TopProfile({super.key});

  @override
  State<TopProfile> createState() => _TopProfileState();
}

class _TopProfileState extends State<TopProfile> {
  // Method to delete the account
  Future<void> deleteAccount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');
    final url = Uri.parse(
        '$uri/api/delete-account'); // Replace with your actual API URL
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': token! // Replace with your actual auth token
    });

    if (response.statusCode == 200) {
      // Handle successful deletion, e.g., redirect to login screen
      Navigator.pushReplacementNamed(context, '/auth-screen');
    } else {
      // Handle errors
      final error = response.body;
      print('Error deleting account: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text("S"),
                      ),
                      Gap(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${user.name[0].toUpperCase()}${user.name.substring(1)}',
                            style: AppTextStyles.topictitle,
                          ),
                          Gap(6),
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                size: 18,
                              ),
                              Gap(10),
                              Text(
                                user.email,
                                style: AppTextStyles.topictitle2,
                              ),
                            ],
                          ),
                          Gap(6),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_outlined,
                                size: 18,
                              ),
                              Gap(10),
                              Text(
                                user.phone,
                                style: AppTextStyles.topictitle2,
                              ),
                            ],
                          ),
                          Gap(6),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 18),
                              Gap(10),
                              Text(
                                user.address,
                                style: AppTextStyles.topictitle2,
                              ),
                            ],
                          ),

                          
                        ],
                      ),
                    ],
                  ),
                  // vSizedBox0,
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       color: Colors.black,
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Icon(
                  //               Icons.workspace_premium_outlined,
                  //               color: Color(0xFFD4AF37),
                  //             ),
                  //             Text(
                  //               " Join Munchin Premium",
                  //               style: TextStyle(
                  //                 color: Color(0xFFD4AF37),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         Icon(
                  //           Icons.arrow_forward_ios_outlined,
                  //           color: Color(0xFFD4AF37),
                  //           size: 15,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
