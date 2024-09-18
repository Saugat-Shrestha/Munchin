import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/account/components/ordermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiced {
  final String baseUrl =
      'https://yourapi.com'; // Replace with your actual API URL

  Future<List<Order>> fetchOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((orderData) => Order.fromMap(orderData)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<Order> changeOrderStatus(String id, int status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('x-auth-token');
    final response = await http.post(
      Uri.parse(
        '$uri/admin/change-order-status',
      ),
      headers: {'Content-Type': 'application/json', 'x-auth-token': token!},
      body: json.encode({'id': id, 'status': status}),
    );

    if (response.statusCode == 200) {
      return Order.fromMap(json.decode(response.body));
    } else {
      print(response.body);
      print(response.statusCode);
      throw Exception('Failed to change order status');
    }
  }
}
