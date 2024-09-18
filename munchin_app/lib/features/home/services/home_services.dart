import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:munchin_app/constants/error_handling.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/constants/utils.dart';
import 'package:munchin_app/models/product.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/products?category=$category'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          List<dynamic> responseData = jsonDecode(res.body);
          for (var item in responseData) {
            productList.add(Product.fromJson(item));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  Future<List<Product>> fetchAllProducts() async {
    try {
      final url = Uri.parse("$uri/api/all_products");
      final response = await http.get(url);
      final responseData = jsonDecode(response.body);
      List<Product> productList = [];

      for (var item in responseData['response']) {
        productList.add(Product.fromJson(item));
      }

      return productList;
    } catch (error) {
      print("Error while fetching products: $error");
      return [];
    }
  }

  Future<Product> fetchDealOfDay({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product product = Product(
      deliverytime: "",
      location: "",
      name: '',
      description: '',
      quantity: 0,
      images: [],
      category: '',
      price: 0,
      foods: [],
      id: "",
    );

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/deal-of-day'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var productData = jsonDecode(res.body);
          product = Product.fromJson(productData);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return product;
  }
}
