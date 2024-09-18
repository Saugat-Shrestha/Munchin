import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Utils {
  //changing the focusnode of textfields
  static void fieldFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //checking email
  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? '*Enter a valid email address'
        : null;
  }

  //flusbar
  static void showFlusbar(BuildContext context, String mssg, Color color) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        duration: const Duration(seconds: 10),
        message: mssg,
        backgroundColor: color,
        // forwardAnimationCurve: Curves.bounceInOut,
        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.bounceInOut,
        borderRadius: BorderRadius.circular(4),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
      )..show(context),
    );
  }

  //copy data to clipboard
  static copyDataToClipBoard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text("Copied to clipboard: $text"),
    //   ),
    // );
  }

  //for parsing the date
  static String parseAndFormatDate(String dateTimeString) {
    try {
      final createdAt = DateTime.parse(dateTimeString);
      final formatedDate = DateFormat('yyyy-MM-dd').format(createdAt);
      return formatedDate;
    } catch (e) {
      return '';
    }
  }

  static String parseAndFormatTime(String dateTimeString) {
    try {
      final createdAt = DateTime.parse(dateTimeString);
      final formattedTime = DateFormat('HH:mm').format(createdAt);
      return formattedTime;
    } catch (e) {
      return '';
    }
  }

  // on will pop scope
  static Future<bool> onWillPop(BuildContext context) {
    DateTime currentBackPressTime = DateTime.now();
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      dynamic snackbar = const SnackBar(
        content: Text('Double tap to exit'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
