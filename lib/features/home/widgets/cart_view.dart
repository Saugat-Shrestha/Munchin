// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:persistent_shopping_cart/model/cart_model.dart';
// import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

// import 'package:munchin_app/app/dimensions/dimensions.dart';
// import 'package:munchin_app/features/home/widgets/PaymentOption.dart';
// import 'package:munchin_app/features/home/widgets/cart_tile_widget.dart';
// import 'package:munchin_app/features/home/widgets/empty_cart_msg_widget.dart';

// class CartView extends StatefulWidget {
//   final bool showLeadingButton; // New parameter
//   const CartView({
//     Key? key,
//     this.showLeadingButton = true,
//   }) : super(key: key);

//   @override
//   State<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends State<CartView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffE2E8F0),
//         leading: widget.showLeadingButton // Check the flag
//             ? IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.arrow_back_ios,
//                 ),
//               )
//             : null, // Hide the leading button if the flag is false
//         title: const Text(
//           'My Cart',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       body: Container(
//         color: Color(0xffE2E8F0),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     color: Color(0xffE2E8F0),
//                     child: PersistentShoppingCart().showCartItems(
//                       cartTileWidget: ({required data}) =>
//                           CartTileWidget(data: data),
//                       showEmptyCartMsgWidget: Container(
//                           color: Color(0xffE2E8F0),
//                           child: const EmptyCartMsgWidget()),
//                     ),
//                   ),
//                 ),
//                 PersistentShoppingCart().showTotalAmountWidget(
//                   cartTotalAmountWidgetBuilder: (totalAmount) => Visibility(
//                     visible: totalAmount == 0.0 ? false : true,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 15.0),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Bill Details",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                             vSizedBox0,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Item Total: ",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                                 Text(
//                                   "Rs " + totalAmount.toString(),
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text("Delivery Charge: ",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                                 Text(
//                                   "Rs 80",
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Divider(
//                               height: 50,
//                               color: Colors.black38,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Total',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   "Rs " + (totalAmount + 80).toString(),
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             vSizedBox0,
//                             SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) {
//                                           return PaymentOptions(
//                                             number: totalAmount + 80,
//                                           );
//                                         },
//                                       ),
//                                     );

//                                     // final shoppingCart =
//                                     //     PersistentShoppingCart();

//                                     // // Retrieve cart data and total price
//                                     // Map<String, dynamic> cartData =
//                                     //     shoppingCart.getCartData();

//                                     // // Extract cart items and total price
//                                     // List<PersistentShoppingCartItem> cartItems =
//                                     //     cartData['cartItems'];
//                                     // double totalPrice = cartData['totalPrice'];

//                                     // /* since cart items is a list, you can run a loop to extract all the values
//                                     //       send it to api or firebase based on your requirement

//                                     //  */

//                                     // log('Total Price: $totalPrice');
//                                   },
//                                   child: const Text(
//                                     'Checkout',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   )),
//                             ),
//                             vSizedBox0,
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/features/home/widgets/PaymentOption.dart';
import 'package:munchin_app/features/home/widgets/cart_tile_widget.dart';
import 'package:munchin_app/features/home/widgets/empty_cart_msg_widget.dart';

class CartView extends StatefulWidget {
  final bool showLeadingButton; // New parameter
  const CartView({
    Key? key,
    this.showLeadingButton = true,
  }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE2E8F0),
        leading: widget.showLeadingButton // Check the flag
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              )
            : null, // Hide the leading button if the flag is false
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        color: Color(0xffE2E8F0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Color(0xffE2E8F0),
                    child: PersistentShoppingCart().showCartItems(
                      cartTileWidget: ({required data}) =>
                          CartTileWidget(data: data),
                      showEmptyCartMsgWidget: Container(
                          color: Color(0xffE2E8F0),
                          child: const EmptyCartMsgWidget()),
                    ),
                  ),
                ),
                PersistentShoppingCart().showTotalAmountWidget(
                  cartTotalAmountWidgetBuilder: (totalAmount) => Visibility(
                    visible: totalAmount == 0.0 ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Bill Details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                )),
                            vSizedBox0,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Item Total: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Text(
                                  "Rs " + totalAmount.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Charge: ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Text(
                                  "Rs 80",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 50,
                              color: Colors.black38,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Rs " + (totalAmount + 80).toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            vSizedBox0,
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PaymentOptions(
                                            number: totalAmount + 80,
                                          );
                                        },
                                      ),
                                    );

                                    // final shoppingCart =
                                    //     PersistentShoppingCart();

                                    // // Retrieve cart data and total price
                                    // Map<String, dynamic> cartData =
                                    //     shoppingCart.getCartData();

                                    // // Extract cart items and total price
                                    // List<PersistentShoppingCartItem> cartItems =
                                    //     cartData['cartItems'];
                                    // double totalPrice = cartData['totalPrice'];

                                    // /* since cart items is a list, you can run a loop to extract all the values
                                    //       send it to api or firebase based on your requirement

                                    //  */

                                    // log('Total Price: $totalPrice');
                                  },
                                  child: const Text(
                                    'Checkout',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                            vSizedBox0,
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}