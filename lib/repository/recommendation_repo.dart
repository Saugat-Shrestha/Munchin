import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:munchin_app/delete/delete_provider.dart';

class RecommendationRepo extends ChangeNotifier {
  List<String> _recommendations = [];
  final ApiService apiService = ApiService();

  List<String> get recommendations => _recommendations;

  void getRecommendations(String content) async {
    try {
      final recommendations = await apiService.getRecommendations(content);
      print('***************************************');
      print(recommendations);
      print('***************************************');

      _recommendations = recommendations;
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
