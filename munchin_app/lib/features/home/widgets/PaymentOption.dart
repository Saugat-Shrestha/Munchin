// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/khalti/khalti.dart';
import 'package:munchin_app/khalti/khalti_payment_page.dart';
import 'package:http/http.dart' as http;
import 'package:munchin_app/providers/user_provider.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentOptions extends StatefulWidget {
  double number;
  PaymentOptions({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  String referenceId = "";
  Future<void> sendOrderToBackend({
    required String email,
    required String name,
    required double totalAmount,
    required String phone,
    required String address,
    required List<PersistentShoppingCartItem> cartItems,
  }) async {
    final url = Uri.parse('$uri/api/order'); // Replace with your backend URL

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        throw Exception("No auth token found");
      }

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
        body: json.encode({
          'email': email,
          'name': name,
          'totalAmount': totalAmount
              .toString(), // Ensure totalAmount is a string if needed
          'phone': phone,
          'address': address,
          'items': cartItems
              .map((item) => {
                    'productName': item.productName,
                    'quantity': item.quantity,
                    'unitPrice': item.unitPrice
                        .toString(), // Ensure unitPrice is a string if needed
                  })
              .toList(),
        }),
      );

      if (response.statusCode == 200) {
        print("Order submitted successfully");
      } else {
        print("Failed to submit order. Status Code: ${response.statusCode}");
        print("Response Body: ${response.body}");
      }
    } catch (e) {
      print("Error sending order: $e");
    }
  }

  Future sendEmail({
    required String email,
    required String subject,
    required String name,
    required String message,
  }) async {
    final serviceId = "service_3xa4i3q";
    final templateId = "template_1467de8";
    final userId = "1WbIpP6HN9FKFtpMr";

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    try {
      var response = await http.post(url,
          headers: {
            'origin': 'http://localhost',
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'service_id': serviceId,
              'template_id': templateId,
              'user_id': userId,
              'template_params': {
                'user_name': name,
                'user_email': email,
                'to_email': 'avengerassemble313@gmail.com',
                'user_subject': subject,
                'user_message': message,
              }
            },
          ));
      print("${response.statusCode}");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFff1f5f9),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("CHECKOUT"),
      ),
      body: Container(
        color: Color(0xFff1f5f9),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select your prefered payment method",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade700,
              ),
            ),
            vSizedBox0,
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12), // Match button's border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 6, // Blur radius
                    offset: Offset(0, 3), // Offset for shadow (x, y)
                  ),
                ],
              ),
              height: MediaQuery.sizeOf(context).height * 0.09,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _openConfirmDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cashes.png', // Path to your PNG file
                      height: 50.0, // Set desired height for the image
                      width: 50.0, // Set desired width for the image
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "COD",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Cash on delivery",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            vSizedBox0,
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(12), // Match button's border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 6, // Blur radius
                    offset: Offset(0, 3), // Offset for shadow (x, y)
                  ),
                ],
              ),
              height: MediaQuery.sizeOf(context).height * 0.09,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return khalti(
                      num: widget.number,
                    );
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/payment.png', // Path to your PNG file
                      height: 50.0, // Set desired height for the image
                      width: 50.0, // Set desired width for the image
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Online Payment",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Khalti",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _openConfirmDialog(BuildContext context) {
  //   final user = Provider.of<UserProvider>(context, listen: false).user;
  //   final shoppingCart = PersistentShoppingCart();

  //   // Retrieve cart data
  //   Map<String, dynamic> cartData = shoppingCart.getCartData();
  //   List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];

  //   // Generate the message with cart items
  //   String cartItemsDetails = cartItems.map((item) {
  //     return '${item.productName} x${item.quantity} - Rs ${item.unitPrice}';
  //   }).join('\n');

  //   String message =
  //       'Your total amount is Rs ${widget.number}, customer phone number is ${user.phone} and location is ${user.address}.\n\nItems:\n$cartItemsDetails';

  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     transitionDuration: const Duration(milliseconds: 300),
  //     barrierLabel: '',
  //     pageBuilder: (context, animation, secondaryAnimation) => Container(),
  //     transitionBuilder: (context, animation, secondaryAnimation, child) {
  //       return ScaleTransition(
  //         scale: Tween<double>(begin: 1.2, end: 1.0).animate(animation),
  //         child: FadeTransition(
  //           opacity: Tween<double>(begin: 0, end: 1.0).animate(animation),
  //           child: AlertDialog(
  //             backgroundColor: Colors.white,
  //             shape: const RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(20.0)),
  //             ),
  //             title: const Text('Confirm',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
  //             content: const Text('Do you want to place an order?',
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(fontWeight: FontWeight.w400)),
  //             actions: [
  //               Padding(
  //                 padding:
  //                     const EdgeInsets.only(left: 15, right: 15, bottom: 10),
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       child: ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           elevation: 0,
  //                           backgroundColor: const Color(0xFfE2E8F0),
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                           ),
  //                         ),
  //                         onPressed: () => Navigator.pop(context),
  //                         child: const Text('No',
  //                             style: TextStyle(color: Colors.black)),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 20),
  //                     Expanded(
  //                       child: ElevatedButton(
  //                         style: ElevatedButton.styleFrom(
  //                           elevation: 0,
  //                           backgroundColor: Colors.red,
  //                           shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(12),
  //                           ),
  //                         ),
  //                         onPressed: () {
  //                           // Clear the cart
  //                           shoppingCart.clearCart();
  //                           // Send an email
  //                           sendEmail(
  //                             email: user.email,
  //                             subject: 'Food Order',
  //                             name: user.name,
  //                             message: message,
  //                           );

  //                           // Show the SnackBar
  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                             SnackBar(
  //                               content: Text("Your order has been placed"),
  //                               duration: Duration(
  //                                   seconds:
  //                                       2), // Duration for which SnackBar is visible
  //                             ),
  //                           );

  //                           // Navigate to the home screen after showing the SnackBar
  //                           Future.delayed(Duration(seconds: 2), () {
  //                             Navigator.pushReplacementNamed(
  //                                 context, '/actual-home');
  //                           });
  //                         },
  //                         child: const Text('Yes',
  //                             style: TextStyle(color: Colors.white)),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  void _openConfirmDialog(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false).user;
    final shoppingCart = PersistentShoppingCart();

    // Retrieve cart data
    Map<String, dynamic> cartData = shoppingCart.getCartData();
    List<PersistentShoppingCartItem> cartItems = cartData['cartItems'];

    // Generate the message with cart items
    String cartItemsDetails = cartItems.map((item) {
      return '${item.productName} x${item.quantity} - Rs ${item.unitPrice}';
    }).join('\n');

    String message =
        'Your total amount is Rs ${widget.number}, customer phone number is ${user.phone} and location is ${user.address}.\n\nItems:\n$cartItemsDetails\n\n It is cash on delivery.';

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 300),
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 1.2, end: 1.0).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1.0).animate(animation),
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              title: const Text('Confirm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              content: const Text('Do you want to place an order?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400)),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFfE2E8F0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('No',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            // Clear the cart
                            shoppingCart.clearCart();

                            // Send an email
                            await sendEmail(
                              email: user.email,
                              subject: 'Food Order',
                              name: user.name,
                              message: message,
                            );

                            // Send the order details to the backend
                            await sendOrderToBackend(
                              email: user.email,
                              name: user.name,
                              totalAmount: widget.number,
                              phone: user.phone,
                              address: user.address,
                              cartItems: cartItems,
                            );

                            // Show the SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Your order has been placed"),
                                duration: Duration(seconds: 2),
                              ),
                            );

                            // Navigate to the home screen after showing the SnackBar
                            Future.delayed(Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(
                                  context, '/actual-home');
                            });
                          },
                          child: const Text('Yes',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
