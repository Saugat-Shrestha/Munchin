import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:munchin_app/constants/error_handling.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/constants/utils.dart';
import 'package:munchin_app/features/admin/models/sales.dart';
import 'package:munchin_app/models/order.dart';
import 'package:munchin_app/models/product.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  // void sellProduct({
  //   required dynamic id,
  //   required BuildContext context,
  //   required String name,
  //   required String deliverytime,
  //   required String location,
  //   required String description,
  //   required double price,
  //   required double quantity,
  //   required String category,
  //   required List<File> images,
  //   required List<FoodItem> foods,
  // }) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);

  //   try {
  //     final cloudinary = CloudinaryPublic('dvojqywro', 'ruurp8en');
  //     List<String> imageUrls = [];

  //     for (int i = 0; i < images.length; i++) {
  //       CloudinaryResponse res = await cloudinary.uploadFile(
  //         CloudinaryFile.fromFile(images[i].path, folder: name),
  //       );
  //       imageUrls.add(res.secureUrl);
  //     }

  //     Product product = Product(
  //       id: id,
  //       name: name,
  //       description: description,
  //       quantity: quantity,
  //       images: imageUrls,
  //       category: category,
  //       price: price,
  //       location: location,
  //       deliverytime: deliverytime,
  //       foods: foods,
  //     );

  //     http.Response res = await http.post(
  //       Uri.parse('$uri/admin/add-product'),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-auth-token': userProvider.user.token,
  //       },
  //       body: jsonEncode(product.toJson()),
  //     );

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         showSnackBar(context, 'Product Added Successfully!');
  //         Navigator.pop(context);
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  // }

  void sellProduct({
    required dynamic id,
    required BuildContext context,
    required String name,
    required String deliverytime,
    required String location,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
    required List<FoodItem> foods,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final cloudinary = CloudinaryPublic('dvojqywro', 'ruurp8en');
      List<String> imageUrls = [];

      // Upload images to Cloudinary
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }

      // Convert foods to JSON
      List<Map<String, dynamic>> foodsJson = foods.map((food) {
        return food.toJson(); // Ensure FoodItem class has a toJson method
      }).toList();

      // Create a product object and convert it to JSON
      Map<String, dynamic> productJson = {
        'id': id,
        'name': name,
        'description': description,
        'quantity': quantity,
        'images': imageUrls,
        'category': category,
        'price': price,
        'location': location,
        'deliverytime': deliverytime,
        'foods': foodsJson,
      };

      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(productJson),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  // // get all the products
  // Future<List<Product>> fetchAllProducts(BuildContext context) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Product> productList = [];
  //   try {
  //     http.Response res =
  //         await http.get(Uri.parse('$uri/admin/get-products'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });

  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         for (int i = 0; i < jsonDecode(res.body).length; i++) {
  //           productList.add(
  //             Product.fromJson(
  //               jsonEncode(
  //                 jsonDecode(res.body)[i],
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     showSnackBar(context, e.toString());
  //   }
  //   return productList;
  // }

  /////////////////////////////
  // Future<List<Product>> fetchAllProducts(BuildContext context) async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   List<Product> productList = [];
  //   print("ssssssssssssssssssssss");
  //   try {
  //     http.Response res =
  //         await http.get(Uri.parse('$uri/admin/get-products'), headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'x-auth-token': userProvider.user.token,
  //     });
  //     print("gggggggggggggggggggggggggggg");
  //     httpErrorHandle(
  //       response: res,
  //       context: context,
  //       onSuccess: () {
  //         List<dynamic> productsJson = jsonDecode(res.body);

  //         // Loop through the decoded JSON and convert it to Product objects
  //         for (var productJson in productsJson) {
  //           productList.add(Product.fromJson(productJson));
  //         }
  //         print(productList);
  //       },
  //     );
  //     print("ttttttttttttttttttttttttttttttttttttttt");
  //   } catch (e) {
  //     // Display error message as a snack bar
  //     showSnackBar(context, e.toString());
  //   }

  //   return productList;
  // }
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];

    print("Fetching products...");

    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-products'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      print("API Response status code: ${res.statusCode}");

      if (res.statusCode == 200) {
        List<dynamic> productsJson = jsonDecode(res.body);

        // Loop through the decoded JSON and convert it to Product objects
        for (var productJson in productsJson) {
          productList.add(Product.fromJson(productJson));
        }

        print("Products fetched successfully");
        print("Number of products: ${productList.length}");
      } else {
        print("Failed to fetch products. Status code: ${res.statusCode}");
        // Handle error scenario, show error message or retry logic
        showSnackBar(context,
            'Failed to fetch products. Status code: ${res.statusCode}');
      }
    } catch (e) {
      print("Exception occurred while fetching products: $e");
      // Display error message as a snack bar or handle appropriately
      showSnackBar(context, 'Error: $e');
    }

    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // Future<List<Order>> fetchAllOrders(BuildContext context) async {
  Future<List> fetchAllOrders(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // List<Order> orderList = [];
    var orderList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-orders'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      print(jsonDecode(res.body));

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return orderList;
  }

  void changeOrderStatus({
    required BuildContext context,
    required int status,
    required Order order,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/change-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<Map<String, dynamic>> getEarnings(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Sales> sales = [];
    int totalEarning = 0;
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/analytics'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          var response = jsonDecode(res.body);
          totalEarning = response['totalEarnings'];
          sales = [
            Sales('Restaurant', response['restaurantEarnings']),
            Sales('Cafe', response['CafeEarnings']),
            Sales('Lounge', response['LoungeEarnings']),
            Sales('Khaja Ghar', response['KhajaGharEarnings']),
            Sales('Diner', response['DinerEarnings']),
            Sales('Pub', response['PubEarnings']),
          ];
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return {
      'sales': sales,
      'totalEarnings': totalEarning,
    };
  }
}
