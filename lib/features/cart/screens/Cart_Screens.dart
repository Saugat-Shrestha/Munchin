// import 'package:flutter/material.dart';
// import 'package:munchin_app/constants/global_variables.dart';
// import 'package:provider/provider.dart';
// import 'package:munchin_app/providers/user_provider.dart';
// import 'package:munchin_app/features/cart/widgets/cart_product.dart';
// import 'package:munchin_app/features/cart/widgets/cart_subtotal.dart';
// import 'package:munchin_app/features/address/screens/address_screen.dart';
// import 'package:munchin_app/features/search/screens/search_screen.dart';

// class CartScreen extends StatefulWidget {
//   static const String routeName = '/screen-details';
//   const CartScreen({Key? key}) : super(key: key);

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   void navigateToSearchScreen(String query) {
//     Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
//   }

//   void navigateToAddress(int sum) {
//     Navigator.pushNamed(
//       context,
//       AddressScreen.routeName,
//       arguments: sum.toString(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<UserProvider>().user;
//     int sum = 0;
//     user.cart
//         .forEach((e) => sum += e['quantity'] * e['product']['price'] as int);

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           backgroundColor: Color(0xFff1f5f9),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 42,
//                   margin: const EdgeInsets.only(
//                     left: 15,
//                     top: 15,
//                   ),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(7),
//                     elevation: 1,
//                     child: TextFormField(
//                       onFieldSubmitted: navigateToSearchScreen,
//                       decoration: InputDecoration(
//                         prefixIcon: InkWell(
//                           onTap: () {},
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                               left: 6,
//                             ),
//                             child: Icon(
//                               Icons.search,
//                               color: GlobalVariables.secondaryColor,
//                               size: 23,
//                             ),
//                           ),
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         contentPadding: const EdgeInsets.only(top: 10),
//                         border: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide.none,
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(7),
//                           ),
//                           borderSide: BorderSide(
//                             color: GlobalVariables.secondaryColor,
//                             width: 1,
//                           ),
//                         ),
//                         hintText: ('Search Clothes'),
//                         hintStyle: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 17,
//                             color: GlobalVariables.secondaryColor),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Consumer<UserProvider>(
//         builder: (context, userProvider, child) {
//           final user = userProvider.user;

//           return SingleChildScrollView(
//             child: Container(
//               width: 700,
//               height: MediaQuery.of(context).size.height,
//               color: Color(0xFff1f5f9),
//               padding: EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 10,
//               ),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 15),
//                   Container(
//                     color: Colors.black12.withOpacity(0.08),
//                     height: 1,
//                   ),
//                   const SizedBox(height: 5),
//                   ListView.builder(
//                     itemCount: user.cart.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return CartProduct(
//                         index: index,
//                       );
//                     },
//                   ),
//                   Container(
//                     color: Colors.black12.withOpacity(0.08),
//                     height: 1,
//                   ),
//                   const CartSubtotal(),
//                   SizedBox(
//                     height: 18,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                       ),
//                       onPressed: () => navigateToAddress(sum),
//                       child: Text(
//                         "Proceed to Buy (${user.cart.length} items)",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/address/screens/address_screen.dart';
import 'package:munchin_app/features/cart/widgets/cart_product.dart';
import 'package:munchin_app/features/cart/widgets/cart_subtotal.dart';
import 'package:munchin_app/features/search/screens/search_screen.dart';
import 'package:munchin_app/models/product.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/screen-details';

  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = context.watch<UserProvider>();
    final List<Map<String, dynamic>> cart = userProvider.user.cart;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text("My Cart"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 700,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFff1f5f9),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                color: Colors.black12.withOpacity(0.08),
                height: 1,
              ),
              const SizedBox(height: 5),
              cart.isEmpty
                  ? Container(
                      height: 77,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5BFDC).withOpacity(0.49),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "There is no item in cart",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // Safely access and parse the product from cart
                        final productMap =
                            cart[index]['product'] as Map<String, dynamic>;
                        final product = Product.fromJson(productMap);
                        final int quantity = cart[index]['quantity'];

                        return CartProduct(
                          product: product,
                          quantity: quantity,
                        );
                      },
                    ),

              //
              // ListView.builder(
              //         itemCount: cart.length,
              //         shrinkWrap: true,
              //         itemBuilder: (context, index) {
              //           final product = cart[index]['product'] as Product;
              //           final int quantity = cart[index]['quantity'];

              //           return CartProduct(
              //             product: product,
              //             quantity: quantity,
              //           );
              //         },
              //       ),
              Container(
                color: Colors.black12.withOpacity(0.08),
                height: 1,
              ),
              // const CartSubtotal(),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () => navigateToAddress(100),
                  child: Text(
                    "Proceed to Buy (${cart.length} items)",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
