// import 'dart:io';

// import 'package:flutter/material.dart';

// enum Availability { loading, available, unavailable }

// class ReviewProvider extends ChangeNotifier {
//   final InAppReview _inAppReview = InAppReview.instance;
//   String _appStoreId = '6502280041';
//   Availability _availability = Availability.loading;

//   ReviewProvider() {
//     initializeReview();
//   }

//   void initializeReview() async {
//     try {
//       final isAvailable = await _inAppReview.isAvailable();
//       _availability = isAvailable && !Platform.isAndroid
//           ? Availability.available
//           : Availability.unavailable;
//     } catch (_) {
//       _availability = Availability.unavailable;
//     }
//     notifyListeners();
//   }

//   void setAppStoreId(String id) {
//     _appStoreId = id;
//     notifyListeners();
//   }

//   Future<void> requestReview() async {
//     await _inAppReview.requestReview();
//   }

//   Future<void> openStoreListing() async {
//     await _inAppReview.openStoreListing(appStoreId: _appStoreId);
//   }

//   Availability get availability => _availability;
// }
