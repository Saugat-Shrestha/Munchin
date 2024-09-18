import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:munchin_app/models/product.dart';
import 'package:provider/provider.dart';
import 'package:munchin_app/providers/user_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = '/details-screen';
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    int _uniqueIdCounter = 0;

    int generateUniqueId() {
      // Using current time in milliseconds since epoch as the base
      int timestamp = DateTime.now().millisecondsSinceEpoch;

      // Increment the counter to ensure uniqueness within the same millisecond
      _uniqueIdCounter++;

      // Combine timestamp with the counter for a unique ID
      return timestamp + _uniqueIdCounter;
    }

    void addToCart(FoodItem foodItem) {
      // Check if the product is of type Product
      if (product is! Product) {
        throw Exception("Expected a Product object but got a Map");
      }

      // Ensure the product has an ID
      final productId = product.id ??
          generateUniqueId().toString(); // Convert to string if needed

      // Debugging statements to check what is being passed
      print('Product: ${jsonEncode(product)}');
      print('FoodItem: ${jsonEncode(foodItem)}');
      print('Generated or existing product ID: $productId');

      // Add the product and food item to the cart
      userProvider.addToCart(product.copyWith(id: productId), foodItem);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${foodItem.name} added to cart')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // AspectRatio(
            //   aspectRatio: 16 / 9,
            //   child: Image.network(
            //     product.images.isNotEmpty
            //         ? product.images[0]
            //         : 'https://via.placeholder.com/150', // Placeholder image
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            Text(
              "Description:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Foods:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.foods.map((food) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${food.name} - \$${food.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(jsonEncode(food));
                          addToCart(food);
                        },
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
