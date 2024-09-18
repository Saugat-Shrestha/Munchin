import 'package:flutter/material.dart';

class CheckBoxProvider with ChangeNotifier {
  bool _isTicked = false;

  bool get isTicked => _isTicked;

  void setTicked(bool? newVal) {
    _isTicked = newVal!;
    notifyListeners();
  }
}
