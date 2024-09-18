// import 'dart:developer';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:munchin_app/constants/global_variables.dart';
// import 'package:munchin_app/features/account/components/ordermodel.dart';

// class GetDataProvider with ChangeNotifier {
//   Items responseData = Items();

//   bool isLoading = false;

//   getMyData() async {
//     isLoading = true;
//     responseData = await getAllData();
//     isLoading = false;
//     notifyListeners();
//   }

//   Future<Items> getAllData() async {
//     try {
//       final response = await http.get(Uri.parse("${uri}/api/orders/me"));
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         responseData = Items.fromJson(item);
//         notifyListeners();
//       } else {
//         print("else");
//       }
//     } catch (e) {
//       log(e.toString());
//     }

//     return responseData;
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/account/components/ordermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:munchin_app/models/ordermodel.dart';
// import 'order_model.dart'; // import your models here

class ApiService {
  // final String baseUrl = 'https://yourapi.com'; // Replace with your API URL

  Future<List<Order>> fetchOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');
    print('Fetching orders...');
    print(Uri.parse("${uri}/api/orders/me"));
    final response =
        await http.get(Uri.parse("${uri}/api/orders/me"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-auth-token': token! // Replace with your actual auth token
    });
    print(response);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      return data.map((orderData) => Order.fromMap(orderData)).toList();
    } else {
      print('object');
      print(response.statusCode);
      throw Exception('Failed to load orders');
    }
  }
}
