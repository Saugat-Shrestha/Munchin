import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/features/account/services/account_services.dart';
import 'package:munchin_app/features/settings/UI/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class more extends StatefulWidget {
  const more({super.key});

  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "More",
            style: AppTextStyles.subTitle,
          ),
          vSizedBox0,
          Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // InkWell(
                //   onTap: () {},
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => AppInfoScreen(),
                //               ));
                //         },
                //         child: Row(
                //           children: [
                //             Icon(Icons.food_bank_outlined),
                //             Gap(5),
                //             Text(
                //               "Settings",
                //             ),
                //           ],
                //         ),
                //       ),
                //       Icon(
                //         Icons.arrow_forward_ios_outlined,
                //         size: 14,
                //       ),
                //     ],
                //   ),
                // ),
                // Divider(
                //   height: 40,
                // ),
                InkWell(
                  onTap: () => AccountServices().logOut(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.food_bank_outlined),
                          Gap(5),
                          GestureDetector(
                            onTap: () => AccountServices().logOut(context),
                            child: Text(
                              "Log out",
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
