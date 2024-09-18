// import 'dart:convert';

// class User {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String address;
//   final String type;
//   final String token;
//   final List<Map<String, dynamic>> cart;

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.address,
//     required this.type,
//     required this.token,
//     required this.cart,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'address': address,
//       'type': type,
//       'token': token,
//       'cart': cart,
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['_id'] ?? '',
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       password: map['password'] ?? '',
//       address: map['address'] ?? '',
//       type: map['type'] ?? '',
//       token: map['token'] ?? '',
//       cart: List<Map<String, dynamic>>.from(
//         map['cart']?.map(
//               (x) => Map<String, dynamic>.from(x),
//             ) ??
//             [],
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));

//   User copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? password,
//     String? address,
//     String? type,
//     String? token,
//     List<Map<String, dynamic>>? cart,
//   }) {
//     return User(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       address: address ?? this.address,
//       type: type ?? this.type,
//       token: token ?? this.token,
//       cart: cart ?? this.cart,
//     );
//   }
// }

// import 'dart:convert';

// class User {
//   final String id;
//   final String name;
//   final String email;
//   final String password;
//   final String address;
//   final String type;
//   final String token;
//   final List<Map<String, dynamic>> cart;
//   final String phone; // Added phone field

//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.address,
//     required this.type,
//     required this.token,
//     required this.cart,
//     required this.phone, // Added phone to the constructor
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'password': password,
//       'address': address,
//       'type': type,
//       'token': token,
//       'cart': cart,
//       'phone': phone, // Include phone in map
//     };
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       id: map['_id'] ?? '',
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//       password: map['password'] ?? '',
//       address: map['address'] ?? '',
//       type: map['type'] ?? '',
//       token: map['token'] ?? '',
//       cart: List<Map<String, dynamic>>.from(
//         map['cart']?.map(
//               (x) => Map<String, dynamic>.from(x),
//             ) ??
//             [],
//       ),
//       phone: map['phone'] ?? '', // Added phone to fromMap
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));

//   User copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? password,
//     String? address,
//     String? type,
//     String? token,
//     List<Map<String, dynamic>>? cart,
//     String? phone, // Added phone to copyWith
//   }) {
//     return User(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       password: password ?? this.password,
//       address: address ?? this.address,
//       type: type ?? this.type,
//       token: token ?? this.token,
//       cart: cart ?? this.cart,
//       phone: phone ?? this.phone, // Include phone in copyWith
//     );
//   }
// }

import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final List<Map<String, dynamic>> cart;
  final String phone; // Ensure phone is treated as a String

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.cart,
    required this.phone, // Added phone to the constructor
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
      'phone': phone, // Include phone in map
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map((x) => Map<String, dynamic>.from(x)) ?? [],
      ),
      phone: map['phone']?.toString() ?? '', // Ensure phone is a String
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<Map<String, dynamic>>? cart,
    String? phone, // Added phone to copyWith
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
      phone: phone ?? this.phone, // Include phone in copyWith
    );
  }
}
