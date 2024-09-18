import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonTxtColor,
    this.isLoading = false,
  });
  final VoidCallback onPressed;
  final Color buttonColor;
  final String buttonText;
  final bool? isLoading;
  final Color buttonTxtColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        onPressed: isLoading == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 3,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading == false
            ? Text(
                buttonText,
                style: TextStyle(
                  color: buttonTxtColor,
                ),
              )
            : const Center(
                child: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 25,
                ),
              ),
      ),
    );
  }
}
