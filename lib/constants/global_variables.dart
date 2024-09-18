import 'package:flutter/material.dart';

// String uri = 'http://192.168.1.84:3000';
// String uri = 'http://192.168.100.32:3000';
String uri = 'http://192.168.11.66:3000';
// String uri = 'http://192.168.100.186:3000';
// String uri = 'http://192.168.1.84:3000';
// String uri = 'http://192.168.2.107:3000';
// String uri = 'http://192.168.1.75:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(236, 156, 70, 46),
      Color.fromARGB(255, 246, 204, 92),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color(0xff005288);

  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.accents;
  static var selectednavBarColor = Color(0xff005288);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Burger',
      'image': 'assets/images/burger.png',
    },
    {
      'title': 'Drink',
      'image': 'assets/images/drink.png',
    },
    {
      'title': 'Pizza ',
      'image': 'assets/images/pizza.png',
    },
    {
      'title': 'Burger',
      'image': 'assets/images/burger.png',
    },
    {
      'title': 'Drink',
      'image': 'assets/images/drink.png',
    },
    {
      'title': 'Pizza ',
      'image': 'assets/images/pizza.png',
    },
    // {
    //   'title': 'Pant',
    //   'image': 'assets/images/Pant.jpg',
    // },
    // {
    //   'title': 'Jacket',
    //   'image': 'assets/images/Jacket.jpg',
    // },
    // {
    //   'title': 'Shoes',
    //   'image': 'assets/images/Shoes.jpg',
    // },
  ];
}
