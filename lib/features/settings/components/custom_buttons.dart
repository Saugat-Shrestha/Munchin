import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomAppButtonInfos extends StatelessWidget {
  CustomAppButtonInfos({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.buttonTxtColor,
    required this.buttonText,
    required this.buttonColor,
    this.buttoniconpath = '',
    this.isIconShowable = false,
    required this.fontsize,
    this.isloading = false,
  });
  final double width;
  final double height;
  final String buttonText;
  final Color buttonTxtColor;
  final Color buttonColor;
  final double fontsize;
  String buttoniconpath;
  bool? isIconShowable;
  bool? isloading;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isloading == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 0,
          foregroundColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Visibility(
                  visible: isIconShowable!,
                  child: SvgPicture.asset(
                    buttoniconpath,
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(
                  child: isloading == true
                      ? const Center(child: CircularProgressIndicator())
                      : Text(
                          buttonText,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: fontsize,
                            fontWeight: FontWeight.bold,
                            color: buttonTxtColor,
                          ),
                        ),
                ),
              ],
            ),
            //action button
          ],
        ),
      ),
    );
  }
}
