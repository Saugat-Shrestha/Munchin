import 'dart:io';

import 'package:flutter/material.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/features/settings/components/contact_us.dart';
import 'package:munchin_app/features/settings/components/custom_button.dart';
import 'package:munchin_app/features/settings/components/review_provider.dart';
import 'package:munchin_app/features/settings/components/utils.dart';
import 'package:provider/provider.dart';

class AppInfoScreen extends StatefulWidget {
  const AppInfoScreen({super.key});

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Munchin',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.authheader,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Version 1.0.0',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                  ),
                  CustomAppButtonInfo(
                    onPressed: () {
                      UtilsExample.openOfficalWebsite(
                          context, 'tracker.h1binfo.org', '');
                    },
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    buttonTxtColor: Colors.black,
                    buttonText: ' Terms and Conditions',
                    buttonColor: Colors.grey.shade200,
                    fontsize: 15,
                    isIconShowable: true,
                    buttoniconpath: "assets/svg/terms_privacy.svg",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAppButtonInfo(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        UtilsExample.shareLink(
                            'https://play.google.com/store/apps/details?id=com.firefly.uscis');
                      } else if (Platform.isIOS) {
                        UtilsExample.shareLink(
                            'https://apps.apple.com/us/app/e-passport/id6502280041');
                      }
                      UtilsExample.shareLink(
                          'https://play.google.com/store/apps/details?id=com.firefly.uscis');
                    },
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    buttonTxtColor: Colors.black,
                    buttonText: ' Share with Friends',
                    buttonColor: Colors.grey.shade200,
                    fontsize: 15,
                    isIconShowable: true,
                    buttoniconpath: "assets/svg/share_icon.svg",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAppButtonInfo(
                    onPressed: () {
                      UtilsExample.openOfficalWebsite(
                          context, 'https://tracker.h1binfo.org/', '');
                    },
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    buttonTxtColor: Colors.black,
                    buttonText: ' Visit our offical website',
                    buttonColor: Colors.grey.shade200,
                    fontsize: 15,
                    isIconShowable: true,
                    buttoniconpath: "assets/svg/web_icon.svg",
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  // CustomAppButtonInfo(
                  //   onPressed: () {
                  //     final pro =
                  //         Provider.of<ReviewProvider>(context, listen: false);
                  //     if (Platform.isAndroid) {
                  //       pro.requestReview();
                  //     } else if (Platform.isIOS) {
                  //       pro.requestReview();
                  //     } else {
                  //       pro.openStoreListing();
                  //     }
                  //   },
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height * 0.07,
                  //   buttonTxtColor: Colors.black,
                  //   buttonText: ' Rate us',
                  //   buttonColor: Colors.grey.shade200,
                  //   fontsize: 15,
                  //   isIconShowable: true,
                  //   buttoniconpath: "assets/svg/rate_us.svg",
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  CustomAppButtonInfo(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ContactScreen(),
                          ));
                    },
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.07,
                    buttonTxtColor: Colors.black,
                    buttonText: ' Contact us',
                    buttonColor: Colors.grey.shade200,
                    fontsize: 15,
                    isIconShowable: true,
                    buttoniconpath: "assets/svg/contact_icon.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
