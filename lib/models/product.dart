// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:munchin_app/models/rating.dart';

// class Product {
//   final String name;
//   final String deliverytime;
//   final String location;
//   final String description;
//   final double quantity;
//   final List<String> images;
//   final String category;
//   final double price;
//   final String? id;
//   final List<Rating>? rating;
//   Product({
//     required this.name,
//     required this.deliverytime,
//     required this.location,
//     required this.description,
//     required this.quantity,
//     required this.images,
//     required this.category,
//     required this.price,
//     this.id,
//     this.rating,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'description': description,
//       'quantity': quantity,
//       'images': images,
//       'category': category,
//       'price': price,
//       'id': id,
//       'rating': rating,
//     };
//   }

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return Product(
//       name: map['name'] ?? '',
//       deliverytime: map['deliverytime'] ?? '',
//       location: map['location'] ?? '',
//       description: map['description'] ?? '',
//       quantity: map['quantity']?.toDouble() ?? 0.0,
//       images: List<String>.from(map['images']),
//       category: map['category'] ?? '',
//       price: map['price']?.toDouble() ?? 0.0,
//       id: map['_id'],
//       rating: map['ratings'] != null
//           ? List<Rating>.from(
//               map['ratings']?.map(
//                 (x) => Rating.fromMap(x),
//               ),
//             )
//           : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Product.fromJson(String source) =>
//       Product.fromMap(json.decode(source));
// }

// class FoodItem {
//   final String id;
//   String name;
//   double price;

//   FoodItem({
//     required this.id,
//     required this.name,
//     required this.price,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'price': price,
//       };

//   factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
//         id: json['id'], // Make sure the ID is included when deserializing
//         name: json['name'],
//         price: json['price'].toDouble(), // Ensure price is converted to double
//       );
// }

// class FoodItem {
//   final String id;
//   final String name;
//   final double price;

//   FoodItem({
//     required this.id,
//     required this.name,
//     required this.price,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'price': price,
//     };
//   }

//   factory FoodItem.fromJson(Map<String, dynamic> json) {
//     return FoodItem(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'],
//     );
//   }
// }

// class Product {
//   dynamic id;
//   dynamic name;
//   dynamic description;
//   double quantity;
//   List<dynamic> images;
//   dynamic category;
//   double price;
//   dynamic location;
//   dynamic deliverytime;
//   List<FoodItem> foods;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.quantity,
//     required this.images,
//     required this.category,
//     required this.price,
//     required this.location,
//     required this.deliverytime,
//     required this.foods,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': name,
//         'description': description,
//         'quantity': quantity,
//         'images': images,
//         'category': category,
//         'price': price,
//         'location': location,
//         'deliverytime': deliverytime,
//         'foods': foods.map((food) => food.toJson()).toList(),
//       };

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json['id'],
//         name: json['name'],
//         description: json['description'],
//         quantity: json['quantity']
//             .toDouble(), // Ensure quantity is converted to double
//         images: List<String>.from(json['images']),
//         category: json['category'],
//         price: json['price'].toDouble(), // Ensure price is converted to double
//         location: json['location'],
//         deliverytime: json['deliverytime'],
//         foods: List<FoodItem>.from(
//           json['foods'].map((food) => FoodItem.fromJson(food)),
//         ),
//       );

//   Product copyWith({
//     dynamic id,
//     String? name,
//     String? description,
//     double? quantity,
//     List<dynamic>? images,
//     dynamic category,
//     double? price,
//     dynamic location,
//     dynamic deliverytime,
//     List<FoodItem>? foods,
//   }) {
//     return Product(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       description: description ?? this.description,
//       quantity: quantity ?? this.quantity,
//       images: images ?? this.images,
//       category: category ?? this.category,
//       price: price ?? this.price,
//       location: location ?? this.location,
//       deliverytime: deliverytime ?? this.deliverytime,
//       foods: foods ?? this.foods,
//     );
//   }
// }



class FoodItem {

  String name;
  double price;

  FoodItem({

    required this.name,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        name: json['name'],
        price: json['price'].toDouble(), // Ensure price is converted to double
      );
}

class Product {
  dynamic id;
  dynamic name;
  dynamic description;
  double quantity;
  List<dynamic> images;
  dynamic category;
  double price;
  dynamic location;
  dynamic deliverytime;
  List<FoodItem> foods;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    required this.location,
    required this.deliverytime,
    required this.foods,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'quantity': quantity,
        'images': images,
        'category': category,
        'price': price,
        'location': location,
        'deliverytime': deliverytime,
        'foods': foods.map((food) => food.toJson()).toList(),
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        quantity: json['quantity']
            .toDouble(), // Ensure quantity is converted to double
        images: List<String>.from(json['images']),
        category: json['category'],
        price: json['price'].toDouble(), // Ensure price is converted to double
        location: json['location'],
        deliverytime: json['deliverytime'],
        foods: List<FoodItem>.from(
          json['foods'].map((food) => FoodItem.fromJson(food)),
        ),
      );

  Product copyWith({
    dynamic id,
    String? name,
    String? description,
    double? quantity,
    List<dynamic>? images,
    dynamic category,
    double? price,
    dynamic location,
    dynamic deliverytime,
    List<FoodItem>? foods,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      category: category ?? this.category,
      price: price ?? this.price,
      location: location ?? this.location,
      deliverytime: deliverytime ?? this.deliverytime,
      foods: foods ?? this.foods,
    );
  }
}