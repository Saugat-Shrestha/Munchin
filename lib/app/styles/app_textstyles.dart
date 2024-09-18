import 'package:flutter/material.dart';
import 'package:munchin_app/app/colors/app_color.dart';

class AppTextStyles {
  static const TextStyle topheader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: GlobalValue.primaryColor,
  );
  static const TextStyle secondaryheader = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: GlobalValue.chatSenderColor,
  );
  static TextStyle subTitle = TextStyle(
    fontSize: 20,
    color: Colors.black.withOpacity(0.6),
    fontWeight: FontWeight.w600,
  );
  static TextStyle subTitle2 = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle secondaryparagraph = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: GlobalValue.chatSenderColor,
  );
  static const TextStyle topictitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle topictitle2 = TextStyle(
    fontSize: 12,
    color: Colors.black,
    // fontWeight: FontWeight.w600,
  );
  static const TextStyle deliverycharge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: GlobalValue.chatSenderColor,
  );

  // authentications
  static const TextStyle authheader = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle authsubheader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
