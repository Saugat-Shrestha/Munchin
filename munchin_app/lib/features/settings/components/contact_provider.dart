import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:munchin_app/features/settings/components/contact_model.dart';


Future<http.Response?> postAllData(FeedbackDataModel data) async {
  http.Response? response;
  try {
    response = await http.post(
        Uri.parse(
          "https://api.childcarecheck.us/api/v1/feedback",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: jsonEncode(data.toJson()));
  } catch (e) {
    log(e.toString());
  }

  return response;
}
