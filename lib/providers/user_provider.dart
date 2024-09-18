// import 'package:flutter/material.dart';
// import 'package:munchin_app/models/user.dart';

// class UserProvider extends ChangeNotifier {
//   User _user = User(
//     id: '',
//     name: '',
//     email: '',
//     password: '',
//     address: '',
//     type: '',
//     token: '',
//     cart: [],
//   );

//   User get user => _user;

//   void setUser(String user) {
//     _user = User.fromJson(user);
//     notifyListeners();
//   }

//   void setUserFromModel(User user) {
//     _user = user;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/models/product.dart';
import 'package:munchin_app/models/user.dart'; // Import your Product model

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    phone: "",
    cart: [], // Initialize cart as an empty list
  );

  User get user => _user;

  void setUser(String userJson) {
    _user = User.fromJson(userJson);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void addToCart(Product product, FoodItem foodItem) {
    bool productExists =
        _user.cart.any((item) => item['product'].id == product.id);

    if (!productExists) {
      // If product doesn't exist in cart, add it
      _user.cart.add({
        'product': product,
        'quantity': 1, // Initially add one quantity
        'foodItems': [foodItem], // Initialize with selected food item
      });
    } else {
      // If product exists, increment quantity and add food item
      int existingIndex =
          _user.cart.indexWhere((item) => item['product'].id == product.id);
      _user.cart[existingIndex]['quantity']++;
      _user.cart[existingIndex]['foodItems'].add(foodItem);
    }

    notifyListeners(); // Notify listeners to update UI
  }
}
