import 'dart:async';
import 'package:flutter/material.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/common/widgets/bottom_bar.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/onboarding%20screen/onboarding_screen.dart';
import 'package:munchin_app/shared_preferences/shared_pref_token.dart';
import 'package:munchin_app/utils/utiils.dart';


// import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferencesToken sharedPreferencesToken = SharedPreferencesToken();
  @override
  void initState() {
    super.initState();
    sharedPreferencesToken.getUser().then((value) {
      if (value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, onBoardingScreen.routeName);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, BottomBar.routeName);
        });
      }
    }).onError((error, stackTrace) {
      Utils.showFlusbar(context, error.toString(), GlobalVariables.backgroundColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.2,
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   child: Image.asset(appLogo),
              // ),
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  'Munchin',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: GlobalValue.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
