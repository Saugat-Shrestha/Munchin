import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/account/components/Update_screen.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffE2E8F0),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: AppTextStyles.authheader,
                  ),

                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  vSizedBox0,
                  Text(
                    "User Name",
                    style: AppTextStyles.authheader,
                  ),

                  Text(
                    user.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  vSizedBox0,
                  Text(
                    "Phone Number",
                    style: AppTextStyles.authheader,
                  ),
                  Text(
                    user.phone,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  vSizedBox0,
                  Text(
                    "Address",
                    style: AppTextStyles.authheader,
                  ),
                  Text(
                    user.address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  vSizedBox0,
                  InkWell(
                    onTap: () async {
                      bool confirm = await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Delete Account"),
                          content: const Text(
                              "Are you sure you want to delete your account? This action cannot be undone."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text("Delete"),
                            ),
                          ],
                        ),
                      );

                      if (confirm) {
                        await deleteAccount(); // Call the method to delete account
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.delete_outline),
                              Text(" Delete account"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Text(userProvider.userData.user?.createdAt ?? "N/A"),
                  // vSizedBox0,
                  // Text(userProvider.userData.user?.updatedAt ?? "N/A"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
