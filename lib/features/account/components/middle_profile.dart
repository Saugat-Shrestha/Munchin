import 'package:flutter/material.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/common/widgets/FAQ.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/account/components/MyOrders.dart';
import 'package:munchin_app/features/account/components/your_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class middleProfile extends StatefulWidget {
  const middleProfile({super.key});

  @override
  State<middleProfile> createState() => _middleProfileState();
}

class _middleProfileState extends State<middleProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(right: 8.0),
              //   child: InkWell(
              //     onTap: () {},
              //     child: Container(
              //       padding: EdgeInsets.all(15),
              //       width: MediaQuery.of(context).size.width * 0.94,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Icon(Icons.favorite_border_outlined),
              //           vSizedBox1,
              //           Text(
              //             "Favourites",
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 15,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              vSizedBox1,
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     padding: EdgeInsets.all(15),
              //     width: MediaQuery.of(context).size.width * 0.485,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Icon(Icons.money_outlined),
              //         vSizedBox1,
              //         Text(
              //           "Money",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 15,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          vSizedBox0,
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return YourProfile();
                },
              ));
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
                      Icon(Icons.person_outlined),
                      Text(" Your Profile"),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          vSizedBox0,
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return OrdersScreen();
                },
              ));
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
                      Icon(Icons.person_outlined),
                      Text(" My Orders"),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          vSizedBox0,

          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FAQ();
                },
              ));
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
                      Icon(Icons.format_quote),
                      Text(" FAQs"),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),

          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 10),
          //     height: 50,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Icon(Icons.star_border_outlined),
          //             Text(" Your ratings"),
          //           ],
          //         ),
          //         Icon(
          //           Icons.arrow_forward_ios_outlined,
          //           size: 14,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
