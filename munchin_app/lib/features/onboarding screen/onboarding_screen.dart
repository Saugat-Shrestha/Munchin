import 'package:flutter/material.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/features/auth/screens/auth_screen.dart';
import 'package:munchin_app/features/onboarding%20screen/onboarding_data.dart';

class onBoardingScreen extends StatefulWidget {
  static const String routeName = '/onboardingScreen';
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  int currentPage = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void continueMethod() {
    // Handle continue action
    Navigator.popAndPushNamed(context, AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: onPageChanged,
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 150,
                  child: Image.asset(
                    onBoardingData[index]["image"],
                  ),
                );
              },
            ),
          ),
          const Text(
            "All your favourites",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Get all your loved foods in one once place,\n you just place the order we do the rest",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black45,
            ),
          ),
          onboardingspace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              onBoardingData.length,
              (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 10,
                  width: (index == currentPage) ? 15 : 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: (index == currentPage
                        ? GlobalValue.secondaryColor
                        : GlobalValue.primaryColor),
                  ),
                );
              },
            ),
          ),
          onboardingspace,
          if (currentPage < onBoardingData.length - 1)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: GlobalValue.primaryColor,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
              ),
              onPressed: () {
                // await _storeOnBoardInfo();
                continueMethod();
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ),
            ),
          if (currentPage == onBoardingData.length - 1)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                backgroundColor: GlobalValue.primaryColor,
              ),
              onPressed: () {
                // _storeOnBoardInfo();
                continueMethod();
              },
              child: const Text(
                "Continue",
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
