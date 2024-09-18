// // // ignore_for_file: public_member_api_docs, sort_constructors_first
// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';
// // import 'package:munchin_app/app/dimensions/dimensions.dart';
// // import 'package:munchin_app/app/styles/app_textstyles.dart';
// // import 'package:munchin_app/features/home/widgets/cart_view.dart';
// // import 'package:munchin_app/providers/user_provider.dart';
// // import 'package:persistent_shopping_cart/model/cart_model.dart';
// // import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

// // import 'package:munchin_app/models/product.dart';
// // import 'package:provider/provider.dart';

// // class FoodItemss extends StatelessWidget {
// //   static const String routeName = '/details-screen';
// //   final Product product;
// //   const FoodItemss({
// //     Key? key,
// //     required this.product,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     final UserProvider userProvider =
// //         Provider.of<UserProvider>(context, listen: false);

// //     int _uniqueIdCounter = 0;

// //     int generateUniqueId() {
// //       // Using current time in milliseconds since epoch as the base
// //       int timestamp = DateTime.now().millisecondsSinceEpoch;

// //       // Increment the counter to ensure uniqueness within the same millisecond
// //       _uniqueIdCounter++;

// //       // Combine timestamp with the counter for a unique ID
// //       return timestamp + _uniqueIdCounter;
// //     }

// //     void addToCart(FoodItem foodItem) {
// //       // Check if the product is of type Product
// //       if (product is! Product) {
// //         throw Exception("Expected a Product object but got a Map");
// //       }

// //       // Ensure the product has an ID
// //       final productId = product.id ?? generateUniqueId();

// //       // Debugging statements to check what is being passed
// //       print('Product: ${jsonEncode(product)}');
// //       print('FoodItem: ${jsonEncode(foodItem)}');
// //       print('Generated or existing product ID: $productId');

// //       // Add the product and food item to the cart
// //       userProvider.addToCart(product.copyWith(id: productId), foodItem);

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('${foodItem.name} added to cart')),
// //       );
// //     }

// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xffE2E8F0),
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: Icon(
// //             Icons.arrow_back_ios,
// //           ),
// //         ),
// //         title: Text("Restaurant Details"),
// //         centerTitle: true,
// //         actions: [
// //           PersistentShoppingCart().showCartItemCountWidget(
// //             cartItemCountWidgetBuilder: (itemCount) => IconButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => const CartView()),
// //                 );
// //               },
// //               icon: Badge(
// //                 label: Text(itemCount.toString()),
// //                 child: const Icon(Icons.shopping_bag_outlined),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 20.0)
// //         ],
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           color: const Color(0xffE2E8F0),
// //         ),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             vSizedBox0,
// //             Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 15),
// //               width: MediaQuery.of(context).size.width,
// //               decoration: BoxDecoration(
// //                 color: Color(0xffE2E8F0),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey,
// //                       borderRadius: BorderRadius.circular(20),
// //                       border: Border.all(
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     width: 80,
// //                     height: 80,
// //                     child: ClipRRect(
// //                       borderRadius: BorderRadius.circular(20),
// //                       child: Image.network(
// //                         product.images.isNotEmpty ? product.images[0] : '',
// //                         fit: BoxFit.cover,
// //                       ),
// //                     ),
// //                   ),
// //                   Gap(10),
// //                   Column(
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         "${product.name}",
// //                         style: const TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.w700,
// //                             color: Colors.black),
// //                       ),
// //                       Row(
// //                         children: [
// //                           Icon(
// //                             Icons.location_on_outlined,
// //                             size: 20,
// //                           ),
// //                           Text(
// //                             " ${product.location}",
// //                             style: const TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.w400,
// //                                 color: Colors.black),
// //                           ),
// //                         ],
// //                       ),
// //                       Text(
// //                         product.description,
// //                         style: const TextStyle(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w500,
// //                             color: Colors.black),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Divider(
// //               height: 40,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 15),
// //               child: Text(
// //                 "Menu",
// //                 style: AppTextStyles.subTitle,
// //               ),
// //             ),
// //             vSizedBox0,
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 15),
// //                 child: ListView.builder(
// //                   itemCount: product.foods.length,
// //                   itemBuilder: (context, index) {
// //                     return Padding(
// //                       padding: const EdgeInsets.only(bottom: 5),
// //                       child: Card(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(5.0),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(
// //                                 mainAxisAlignment: MainAxisAlignment.start,
// //                                 crossAxisAlignment: CrossAxisAlignment.center,
// //                                 mainAxisSize: MainAxisSize.max,
// //                                 children: [
// //                                   const SizedBox(
// //                                     width: 10,
// //                                   ),
// //                                   Expanded(
// //                                     child: Column(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.start,
// //                                       crossAxisAlignment:
// //                                           CrossAxisAlignment.start,
// //                                       children: [
// //                                         Text(
// //                                           "${product.foods[index].name}",
// //                                           style: const TextStyle(
// //                                               fontSize: 18,
// //                                               fontWeight: FontWeight.w600,
// //                                               color: Colors.black),
// //                                         ),
// //                                         const SizedBox(
// //                                           height: 5,
// //                                         ),
// //                                         Text(
// //                                           "Rs ${product.foods[index].price}",
// //                                           style: const TextStyle(
// //                                               fontSize: 16,
// //                                               fontWeight: FontWeight.w500),
// //                                         ),
// //                                         Align(
// //                                           alignment: Alignment.centerRight,
// //                                           child: PersistentShoppingCart()
// //                                               .showAndUpdateCartItemWidget(
// //                                             inCartWidget: Container(
// //                                               height: 30,
// //                                               width: 70,
// //                                               decoration: BoxDecoration(
// //                                                 borderRadius:
// //                                                     BorderRadius.circular(20),
// //                                                 border: Border.all(
// //                                                     color: Colors.red),
// //                                               ),
// //                                               child: Center(
// //                                                 child: Text(
// //                                                   'Remove',
// //                                                   style: Theme.of(context)
// //                                                       .textTheme
// //                                                       .bodySmall,
// //                                                 ),
// //                                               ),
// //                                             ),
// //                                             notInCartWidget: Container(
// //                                               height: 30,
// //                                               width: 100,
// //                                               decoration: BoxDecoration(
// //                                                 border: Border.all(
// //                                                     color: Colors.green),
// //                                                 borderRadius:
// //                                                     BorderRadius.circular(20),
// //                                               ),
// //                                               child: Padding(
// //                                                 padding:
// //                                                     const EdgeInsets.symmetric(
// //                                                         horizontal: 5),
// //                                                 child: Center(
// //                                                   child: Text(
// //                                                     'Add to cart',
// //                                                     style: Theme.of(context)
// //                                                         .textTheme
// //                                                         .bodySmall,
// //                                                   ),
// //                                                 ),
// //                                               ),
// //                                             ),
// //                                             product: PersistentShoppingCartItem(
// //                                                 productId: index.toString(),
// //                                                 productName:
// //                                                     product.foods[index].name,
// //                                                 unitPrice: double.parse(product
// //                                                     .foods[index].price
// //                                                     .toString()),
// //                                                 quantity: 2),
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ),
// //                                   )
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:munchin_app/app/dimensions/dimensions.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';
// import 'package:munchin_app/features/home/widgets/cart_view.dart';
// import 'package:munchin_app/providers/user_provider.dart';
// import 'package:persistent_shopping_cart/model/cart_model.dart';
// import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

// import 'package:munchin_app/models/product.dart';
// import 'package:provider/provider.dart';

// class FoodItemss extends StatelessWidget {
//   static const String routeName = '/details-screen';
//   final Product product;
//   const FoodItemss({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final UserProvider userProvider =
//         Provider.of<UserProvider>(context, listen: false);

//     void addToCart(FoodItem foodItem) {
//       // Ensure the foodItem has a unique ID
//       final productId = foodItem.id; // Use the unique ID of the foodItem

//       // Debugging statements to check what is being passed
//       print('Product: ${foodItem.name}');
//       print('Generated or existing product ID: $productId');

//       // Add the product and food item to the cart
//       userProvider.addToCart(product, foodItem);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('${foodItem.name} added to cart')),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffE2E8F0),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//           ),
//         ),
//         title: Text("Restaurant Details"),
//         centerTitle: true,
//         actions: [
//           PersistentShoppingCart().showCartItemCountWidget(
//             cartItemCountWidgetBuilder: (itemCount) => IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const CartView()),
//                 );
//               },
//               icon: Badge(
//                 label: Text(itemCount.toString()),
//                 child: const Icon(Icons.shopping_bag_outlined),
//               ),
//             ),
//           ),
//           const SizedBox(width: 20.0)
//         ],
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xffE2E8F0),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             vSizedBox0,
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Color(0xffE2E8F0),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey,
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(
//                         color: Colors.black,
//                       ),
//                     ),
//                     width: 80,
//                     height: 80,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: Image.network(
//                         product.images.isNotEmpty ? product.images[0] : '',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Gap(10),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${product.name}",
//                         style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.black),
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.location_on_outlined,
//                             size: 20,
//                           ),
//                           Text(
//                             " ${product.location}",
//                             style: const TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: Colors.black),
//                           ),
//                         ],
//                       ),
//                       Text(
//                         product.description,
//                         style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               height: 40,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(
//                 "Menu",
//                 style: AppTextStyles.subTitle,
//               ),
//             ),
//             vSizedBox0,
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: ListView.builder(
//                   itemCount: product.foods.length,
//                   itemBuilder: (context, index) {
//                     final foodItem =
//                         product.foods[index]; // Get the food item directly
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 5),
//                       child: Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "${foodItem.name}",
//                                           style: const TextStyle(
//                                               fontSize: 18,
//                                               fontWeight: FontWeight.w600,
//                                               color: Colors.black),
//                                         ),
//                                         const SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text(
//                                           "Rs ${foodItem.price}",
//                                           style: const TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.centerRight,
//                                           child: PersistentShoppingCart()
//                                               .showAndUpdateCartItemWidget(
//                                             inCartWidget: Container(
//                                               height: 30,
//                                               width: 70,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                                 border: Border.all(
//                                                     color: Colors.red),
//                                               ),
//                                               child: Center(
//                                                 child: Text(
//                                                   'Remove',
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodySmall,
//                                                 ),
//                                               ),
//                                             ),
//                                             notInCartWidget: Container(
//                                               height: 30,
//                                               width: 100,
//                                               decoration: BoxDecoration(
//                                                 border: Border.all(
//                                                     color: Colors.green),
//                                                 borderRadius:
//                                                     BorderRadius.circular(20),
//                                               ),
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 5),
//                                                 child: Center(
//                                                   child: Text(
//                                                     'Add to cart',
//                                                     style: Theme.of(context)
//                                                         .textTheme
//                                                         .bodySmall,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             product: PersistentShoppingCartItem(
//                                                 productId: foodItem.id ??
//                                                     "default_id", // Use the unique ID
//                                                 productName: foodItem.name ??
//                                                     "Unknown Food Item",
//                                                 unitPrice: foodItem.price,
//                                                 quantity: 2),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/features/home/widgets/cart_view.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:persistent_shopping_cart/model/cart_model.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';

import 'package:munchin_app/models/product.dart';
import 'package:provider/provider.dart';

class FoodItemss extends StatelessWidget {
  static const String routeName = '/details-screen';
  final Product product;
  const FoodItemss({
    Key? key,
    required this.product,
  }) : super(key: key);

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
      final productId = product.id ?? generateUniqueId();

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
        backgroundColor: Color(0xffE2E8F0),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text("Restaurant Details"),
        centerTitle: true,
        actions: [
          PersistentShoppingCart().showCartItemCountWidget(
            cartItemCountWidgetBuilder: (itemCount) => IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartView()),
                );
              },
              icon: Badge(
                label: Text(itemCount.toString()),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
            ),
          ),
          const SizedBox(width: 20.0)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xffE2E8F0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSizedBox0,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffE2E8F0),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        product.images.isNotEmpty ? product.images[0] : '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${product.name}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 20,
                          ),
                          Text(
                            " ${product.location}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Menu",
                style: AppTextStyles.subTitle,
              ),
            ),
            vSizedBox0,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: product.foods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${product.foods[index].name}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Rs ${product.foods[index].price}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: PersistentShoppingCart()
                                              .showAndUpdateCartItemWidget(
                                            inCartWidget: Container(
                                              height: 30,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.red),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Remove',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            ),
                                            notInCartWidget: Container(
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.green),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Center(
                                                  child: Text(
                                                    'Add to cart',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            product: PersistentShoppingCartItem(
                                                productId: product.name +
                                                    index.toString(),
                                                productName:
                                                    product.foods[index].name,
                                                unitPrice: double.parse(product
                                                    .foods[index].price
                                                    .toString()),
                                                quantity: 2),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
