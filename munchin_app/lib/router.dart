import 'package:flutter/material.dart';
import 'package:munchin_app/common/widgets/bottom_bar.dart';
import 'package:munchin_app/features/address/screens/address_screen.dart';
import 'package:munchin_app/features/admin/screens/add_product_screen.dart';
import 'package:munchin_app/features/admin/screens/admin_screen.dart';
import 'package:munchin_app/features/auth/screens/auth_screen.dart';
import 'package:munchin_app/features/auth/screens/register.dart';
import 'package:munchin_app/features/cart/screens/Cart_Screens.dart';
import 'package:munchin_app/features/home/screens/category_deals_screen.dart';
import 'package:munchin_app/features/home/screens/home_screen.dart';
import 'package:munchin_app/features/home/widgets/productDetailsScreen.dart';
import 'package:munchin_app/features/onboarding%20screen/onboarding_screen.dart';
import 'package:munchin_app/features/order_details/screens/order_details.dart';
import 'package:munchin_app/features/product_details/screens/product_details_screen.dart';
import 'package:munchin_app/features/search/screens/search_screen.dart';
import 'package:munchin_app/features/splash_screen/splash_screen.dart';
import 'package:munchin_app/models/order.dart';

import 'models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );
    case onBoardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const onBoardingScreen(),
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );
    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RegisterScreen(),
      );
    case AdminScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AdminScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CartScreen(),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
