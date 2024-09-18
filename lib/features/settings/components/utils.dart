import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilsExample {
  static void showSnackBar(
      BuildContext context, String message, String actionLabel) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: () {
          // Handle action press if needed
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static shareLink(String? link) async {
    if (link != null) {
      Share.share(link,
          subject: 'Check it out from US National Debt Clock App Free !!');
    }
  }

  static shareImage(String? imageFilePath) async {
    if (imageFilePath != null) {
      final file = File(imageFilePath);
      if (await file.exists()) {
        try {
          await Share.share(
            'Hey Checkout !',
          );
          await Share.shareFiles(
            [imageFilePath],
            text: 'US National Debt Clock App Free',
          );
          // await Share.share(text: 'Hey Checkout !', files: [imageFilePath]);
          // await Share.shareXFiles(
          //   [XFile(imageFilePath)],
          //   text: 'E passport & Visa Photo Maker',
          // );
        } catch (e) {
          if (kDebugMode) {
            print('Error sharing image: $e');
          }
        }
      } else {
        if (kDebugMode) {
          print('Error: The file does not exist at path: $imageFilePath');
        }
      }
    }
  }

  static openOfficalWebsite(
    BuildContext context,
    String host,
    String path,
  ) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: host,
      path: path,
    );
    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Can not load website', '');
        throw 'Can not launch url';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error launching URL: $e');
      }
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Can not load website', '');
    }
  }

  static openPlayStore(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'Cannot load website', '');
        throw 'Cannot launch URL';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error launching URL: $e');
      }
      // ignore: use_build_context_synchronously
      showSnackBar(context, 'Cannot load website', '');
    }
  }
}
