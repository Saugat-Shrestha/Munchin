import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:munchin_app/features/settings/components/contact_model.dart';
import 'package:munchin_app/features/settings/components/contact_provider.dart';

class PostDataProvider extends ChangeNotifier {

  bool loading = false;
  bool isBack = false;
  Future<void> postData(FeedbackDataModel body) async {
    loading = true;
    notifyListeners();
    http.Response response = (await postAllData(body))!;
    if (response.statusCode == 200) {
      isBack = true;
    }
    loading = false;
    notifyListeners();
  }
}
