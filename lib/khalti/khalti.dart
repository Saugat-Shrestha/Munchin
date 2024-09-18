// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';

class khalti extends StatefulWidget {
  double num;
  khalti({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  State<khalti> createState() => _khaltiState();
}

class _khaltiState extends State<khalti> {
  String referenceId = "";
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
        title: const Text("Online Payment"),
      ),
      body: Container(
        color: Color(0xFff1f5f9),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
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
                      'assets/images/khaltilogo.png', // Path to your PNG file
                      height: 80.0, // Set desired height for the image
                      width: 80.0, // Set desired width for the image
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Khalti",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Pay with khalti",
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
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/esewa.png', // Path to your PNG file
                      height: 80.0, // Set desired height for the image
                      width: 80.0, // Set desired width for the image
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "eSewa",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Coming soon",
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
            Text(referenceId)
          ],
        ),
      ),
    );
  }

  payWithKhaltiInApp() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: widget.num.toInt() * 100, //in paisa
        productIdentity: 'Product Id',
        productName: 'Product Name',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.khalti,
        PaymentPreference.connectIPS,
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(PaymentSuccessModel success) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          actions: [
            SimpleDialogOption(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    referenceId = success.idx;
                  });

                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  }

  void onFailure(PaymentFailureModel failure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment Failed: ${failure.message}'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
    debugPrint(
      failure.toString(),
    );
  }

  void onCancel() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Payment Cancelled'),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 3),
      ),
    );
    debugPrint('Cancelled');
  }

  // void _openConfirmDialog(BuildContext context) {
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
  //             content: const Text('Do you want to place an order ?',
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
  //                           Future.delayed(Duration(seconds: 5), () {
  //                             ScaffoldMessenger.of(context).showSnackBar(
  //                               SnackBar(
  //                                 content: Text(
  //                                     "Your order will be placed after completion of payment"),
  //                                 duration: Duration(
  //                                     seconds:
  //                                         2), // Duration for which SnackBar is visible
  //                               ),
  //                             );
  //                           });
  //                           // Show the SnackBar

  //                           // Navigate to the home screen after showing the SnackBar
  //                           Future.delayed(Duration(seconds: 2), () {
  //                             payWithKhaltiInApp();
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
        'Your total amount is Rs ${widget.num}, customer phone number is ${user.phone} and location is ${user.address}.\n\nItems:\n$cartItemsDetails\n\n It is paid on khalti.';

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
                          //                         onPressed: () {
                          //                           Future.delayed(Duration(seconds: 5), () {
                          //                             ScaffoldMessenger.of(context).showSnackBar(
                          //                               SnackBar(
                          //                                 content: Text(
                          //                                     "Your order will be placed after completion of payment"),
                          //                                 duration: Duration(
                          //                                     seconds:
                          //                                         2), // Duration for which SnackBar is visible
                          //                               ),
                          //                             );
                          //                           });
                          //                           // Show the SnackBar

                          //                           // Navigate to the home screen after showing the SnackBar
                          //                           Future.delayed(Duration(seconds: 2), () {
                          //                             payWithKhaltiInApp();
                          //                           });
                          //                         },
                          onPressed: () {
                            // Send an email
                            sendEmail(
                              email: user.email,
                              subject: 'Food Order',
                              name: user.name,
                              message: message,
                            );

                            // Show the SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Your order will be placed after completion of payment"),
                                duration: Duration(
                                    seconds:
                                        2), // Duration for which SnackBar is visible
                              ),
                            );

                            // Navigate to the home screen after showing the SnackBar
                            Future.delayed(Duration(seconds: 2), () {
                              payWithKhaltiInApp();
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
