// // // import 'dart:io';

// // // import 'package:carousel_slider/carousel_slider.dart';
// // // import 'package:dotted_border/dotted_border.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:munchin_app/common/widgets/custom_button.dart';
// // // import 'package:munchin_app/common/widgets/custom_textfield.dart';
// // // import 'package:munchin_app/constants/global_variables.dart';
// // // import 'package:munchin_app/constants/utils.dart';
// // // import 'package:munchin_app/features/admin/services/admin_services.dart';

// // // class AddProductScreen extends StatefulWidget {
// // //   static const String routeName = '/add-product';
// // //   const AddProductScreen({Key? key}) : super(key: key);

// // //   @override
// // //   State<AddProductScreen> createState() => _AddProductScreenState();
// // // }

// // // class _AddProductScreenState extends State<AddProductScreen> {
// // //   final TextEditingController productNameController = TextEditingController();
// // //   final TextEditingController descriptionController = TextEditingController();
// // //   final TextEditingController priceController = TextEditingController();
// // //   final TextEditingController quantityController = TextEditingController();
// // //   final TextEditingController deliverytimeController = TextEditingController();
// // //   final TextEditingController locationController = TextEditingController();
// // //   final AdminServices adminServices = AdminServices();

// // //   String category = 'Restaurant';
// // //   List<File> images = [];
// // //   final _addProductFormKey = GlobalKey<FormState>();

// // //   @override
// // //   void dispose() {
// // //     super.dispose();
// // //     productNameController.dispose();
// // //     descriptionController.dispose();
// // //     priceController.dispose();
// // //     quantityController.dispose();
// // //     deliverytimeController.dispose();
// // //     locationController.dispose();
// // //   }

// // //   List<String> productCategories = [
// // //     'Restaurant',
// // //     'Shirt',
// // //     'OnePiece',
// // //     'Pant',
// // //     'Jacket',
// // //     'Shoes',
// // //   ];

// // //   void sellProduct() {
// // //     if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
// // //       adminServices.sellProduct(
// // //         context: context,
// // //         name: productNameController.text,
// // //         deliverytime: deliverytimeController.text,
// // //         location: locationController.text,
// // //         description: descriptionController.text,
// // //         price: double.parse(priceController.text),
// // //         quantity: double.parse(quantityController.text),
// // //         category: category,
// // //         images: images,
// // //       );
// // //     }
// // //   }

// // //   void selectImages() async {
// // //     var res = await pickImages();
// // //     setState(() {
// // //       images = res;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: PreferredSize(
// // //         preferredSize: const Size.fromHeight(50),
// // //         child: AppBar(
// // //           flexibleSpace: Container(
// // //             decoration: const BoxDecoration(
// // //               color: GlobalVariables.secondaryColor,
// // //             ),
// // //           ),
// // //           title: const Text(
// // //             'Add Restaurant',
// // //             style: TextStyle(
// // //               color: Colors.black,
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Form(
// // //           key: _addProductFormKey,
// // //           child: Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
// // //             child: Column(
// // //               children: [
// // //                 const SizedBox(height: 20),
// // //                 images.isNotEmpty
// // //                     ? CarouselSlider(
// // //                         items: images.map(
// // //                           (i) {
// // //                             return Builder(
// // //                               builder: (BuildContext context) => Image.file(
// // //                                 i,
// // //                                 fit: BoxFit.cover,
// // //                                 height: 200,
// // //                               ),
// // //                             );
// // //                           },
// // //                         ).toList(),
// // //                         options: CarouselOptions(
// // //                           viewportFraction: 1,
// // //                           height: 200,
// // //                         ),
// // //                       )
// // //                     : GestureDetector(
// // //                         onTap: selectImages,
// // //                         child: DottedBorder(
// // //                           borderType: BorderType.RRect,
// // //                           radius: const Radius.circular(10),
// // //                           dashPattern: const [10, 4],
// // //                           strokeCap: StrokeCap.round,
// // //                           child: Container(
// // //                             width: double.infinity,
// // //                             height: 150,
// // //                             decoration: BoxDecoration(
// // //                               borderRadius: BorderRadius.circular(10),
// // //                             ),
// // //                             child: Column(
// // //                               mainAxisAlignment: MainAxisAlignment.center,
// // //                               children: [
// // //                                 const Icon(
// // //                                   Icons.folder_open,
// // //                                   size: 40,
// // //                                 ),
// // //                                 const SizedBox(height: 15),
// // //                                 Text(
// // //                                   'Select Clothes Images',
// // //                                   style: TextStyle(
// // //                                     fontSize: 15,
// // //                                     color: Colors.grey.shade400,
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                 const SizedBox(height: 30),
// // //                 CustomTextField(
// // //                   controller: productNameController,
// // //                   hintText: 'Clothes Brand',
// // //                 ),
// // //                 CustomTextField(
// // //                   controller: deliverytimeController,
// // //                   hintText: 'Delivery Time',
// // //                 ),
// // //                 CustomTextField(
// // //                   controller: locationController,
// // //                   hintText: 'location',
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 CustomTextField(
// // //                   controller: descriptionController,
// // //                   hintText: 'Description',
// // //                   maxLines: 7,
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 CustomTextField(
// // //                   controller: priceController,
// // //                   hintText: 'Price',
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 CustomTextField(
// // //                   controller: quantityController,
// // //                   hintText: 'Quantity',
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   child: DropdownButton(
// // //                     value: category,
// // //                     icon: const Icon(Icons.keyboard_arrow_down),
// // //                     items: productCategories.map((String item) {
// // //                       return DropdownMenuItem(
// // //                         value: item,
// // //                         child: Text(item),
// // //                       );
// // //                     }).toList(),
// // //                     onChanged: (String? newVal) {
// // //                       setState(() {
// // //                         category = newVal!;
// // //                       });
// // //                     },
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 CustomButton(
// // //                   text: 'Add',
// // //                   onTap: sellProduct,
// // //                 ),
// // //                 const SizedBox(height: 20),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';

// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:dotted_border/dotted_border.dart';
// // import 'package:flutter/material.dart';
// // import 'package:munchin_app/common/widgets/custom_button.dart';
// // import 'package:munchin_app/common/widgets/custom_textfield.dart';
// // import 'package:munchin_app/constants/global_variables.dart';
// // import 'package:munchin_app/constants/utils.dart';
// // import 'package:munchin_app/features/admin/services/admin_services.dart';
// // import 'package:munchin_app/models/product.dart';

// // class AddProductScreen extends StatefulWidget {
// //   static const String routeName = '/add-product';
// //   const AddProductScreen({Key? key}) : super(key: key);

// //   @override
// //   State<AddProductScreen> createState() => _AddProductScreenState();
// // }

// // class _AddProductScreenState extends State<AddProductScreen> {
// //   final TextEditingController productNameController = TextEditingController();
// //   final TextEditingController descriptionController = TextEditingController();
// //   final TextEditingController priceController = TextEditingController();
// //   final TextEditingController quantityController = TextEditingController();
// //   final TextEditingController deliverytimeController = TextEditingController();
// //   final TextEditingController locationController = TextEditingController();
// //   final TextEditingController foodNameController = TextEditingController();
// //   final TextEditingController foodPriceController = TextEditingController();
// //   final AdminServices adminServices = AdminServices();

// //   String category = 'Restaurant';
// //   List<File> images = [];
// //   List<FoodItem> foods = [];
// //   final _addProductFormKey = GlobalKey<FormState>();

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     productNameController.dispose();
// //     descriptionController.dispose();
// //     priceController.dispose();
// //     quantityController.dispose();
// //     deliverytimeController.dispose();
// //     locationController.dispose();
// //     foodNameController.dispose();
// //     foodPriceController.dispose();
// //   }

// //   List<String> productCategories = [
// //     'Restaurant',
// //     'Cafe',
// //     'Lounge',
// //     'Khaja Ghar',
// //     'Diner',
// //     'Pub',
// //   ];

// //   int _uniqueIdCounter = 0;

// //   int generateUniqueId() {
// //     // Using current time in milliseconds since epoch as the base
// //     int timestamp = DateTime.now().millisecondsSinceEpoch;

// //     // Increment the counter to ensure uniqueness within the same millisecond
// //     _uniqueIdCounter++;

// //     // Combine timestamp with the counter for a unique ID
// //     return timestamp + _uniqueIdCounter;
// //   }

// //   void sellProduct() {
// //     if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
// //       int productId = generateUniqueId(); // Generate a unique ID
// //       print(productId);
// //       adminServices.sellProduct(
// //         id: productId, // Pass the generated ID
// //         context: context,
// //         name: productNameController.text,
// //         deliverytime: deliverytimeController.text,
// //         location: locationController.text,
// //         description: descriptionController.text,
// //         price: double.parse(priceController.text),
// //         quantity: double.parse(quantityController.text),
// //         category: category,
// //         images: images,
// //         foods: foods,
// //       );
// //     }
// //   }

// //   void addFoodItem() {
// //     if (foodNameController.text.isNotEmpty &&
// //         foodPriceController.text.isNotEmpty) {
// //       setState(() {
// //         foods.add(FoodItem(

// //           name: foodNameController.text,
// //           price: double.parse(foodPriceController.text),
// //         ));
// //         foodNameController.clear();
// //         foodPriceController.clear();
// //       });
// //     }
// //   }

// //   void selectImages() async {
// //     var res = await pickImages();
// //     setState(() {
// //       images = res;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: const Size.fromHeight(50),
// //         child: AppBar(
// //           flexibleSpace: Container(
// //             decoration: const BoxDecoration(
// //               color: GlobalVariables.secondaryColor,
// //             ),
// //           ),
// //           title: const Text(
// //             'Add Restaurant',
// //             style: TextStyle(
// //               color: Colors.black,
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Form(
// //           key: _addProductFormKey,
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //             child: Column(
// //               children: [
// //                 const SizedBox(height: 20),
// //                 images.isNotEmpty
// //                     ? CarouselSlider(
// //                         items: images.map(
// //                           (i) {
// //                             return Builder(
// //                               builder: (BuildContext context) => Image.file(
// //                                 i,
// //                                 fit: BoxFit.cover,
// //                                 height: 200,
// //                               ),
// //                             );
// //                           },
// //                         ).toList(),
// //                         options: CarouselOptions(
// //                           viewportFraction: 1,
// //                           height: 200,
// //                         ),
// //                       )
// //                     : GestureDetector(
// //                         onTap: selectImages,
// //                         child: DottedBorder(
// //                           borderType: BorderType.RRect,
// //                           radius: const Radius.circular(10),
// //                           dashPattern: const [10, 4],
// //                           strokeCap: StrokeCap.round,
// //                           child: Container(
// //                             width: double.infinity,
// //                             height: 150,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10),
// //                             ),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 const Icon(
// //                                   Icons.folder_open,
// //                                   size: 40,
// //                                 ),
// //                                 const SizedBox(height: 15),
// //                                 Text(
// //                                   'Select Restaurant Images',
// //                                   style: TextStyle(
// //                                     fontSize: 15,
// //                                     color: Colors.grey.shade400,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                 const SizedBox(height: 30),
// //                 CustomTextField(
// //                   controller: productNameController,
// //                   hintText: 'Restaurant Name',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: deliverytimeController,
// //                   hintText: 'Delivery Time',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: locationController,
// //                   hintText: 'location',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: descriptionController,
// //                   hintText: 'Description',
// //                   maxLines: 7,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: priceController,
// //                   hintText: 'Price',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: quantityController,
// //                   hintText: 'Quantity',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: DropdownButton(
// //                     value: category,
// //                     icon: const Icon(Icons.keyboard_arrow_down),
// //                     items: productCategories.map((String item) {
// //                       return DropdownMenuItem(
// //                         value: item,
// //                         child: Text(item),
// //                       );
// //                     }).toList(),
// //                     onChanged: (String? newVal) {
// //                       setState(() {
// //                         category = newVal!;
// //                       });
// //                     },
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   'Food Items',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: foodNameController,
// //                   hintText: 'Food Name',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: foodPriceController,
// //                   hintText: 'Food Price',
// //                   // keyboardType: TextInputType.number,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomButton(
// //                   text: 'Add Food Item',
// //                   onTap: addFoodItem,
// //                 ),
// //                 const SizedBox(height: 20),
// //                 ListView.builder(
// //                   shrinkWrap: true,
// //                   physics: NeverScrollableScrollPhysics(),
// //                   itemCount: foods.length,
// //                   itemBuilder: (context, index) {
// //                     final food = foods[index];
// //                     return ListTile(
// //                       title: Text(food.name),
// //                       subtitle:
// //                           Text('Price: \$${food.price.toStringAsFixed(2)}'),
// //                       trailing: IconButton(
// //                         icon: Icon(Icons.delete, color: Colors.red),
// //                         onPressed: () {
// //                           setState(() {
// //                             foods.removeAt(index);
// //                           });
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomButton(
// //                   text: 'Add',
// //                   onTap: sellProduct,
// //                 ),
// //                 const SizedBox(height: 20),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:munchin_app/common/widgets/custom_button.dart';
// import 'package:munchin_app/common/widgets/custom_textfield.dart';
// import 'package:munchin_app/constants/global_variables.dart';
// import 'package:munchin_app/constants/utils.dart';
// import 'package:munchin_app/features/admin/services/admin_services.dart';
// import 'package:munchin_app/models/product.dart';
// import 'package:uuid/uuid.dart'; // Import for generating unique IDs

// class AddProductScreen extends StatefulWidget {
//   static const String routeName = '/add-product';
//   const AddProductScreen({Key? key}) : super(key: key);

//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }

// class _AddProductScreenState extends State<AddProductScreen> {
//   final TextEditingController productNameController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController quantityController = TextEditingController();
//   final TextEditingController deliverytimeController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController foodNameController = TextEditingController();
//   final TextEditingController foodPriceController = TextEditingController();
//   final AdminServices adminServices = AdminServices();

//   String category = 'Restaurant';
//   List<File> images = [];
//   List<FoodItem> foods = [];
//   final _addProductFormKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     super.dispose();
//     productNameController.dispose();
//     descriptionController.dispose();
//     priceController.dispose();
//     quantityController.dispose();
//     deliverytimeController.dispose();
//     locationController.dispose();
//     foodNameController.dispose();
//     foodPriceController.dispose();
//   }

//   List<String> productCategories = [
//     'Restaurant',
//     'Cafe',
//     'Lounge',
//     'Khaja Ghar',
//     'Diner',
//     'Pub',
//   ];

//   final Uuid _uuid = Uuid();

//   void sellProduct() {
//     if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
//       String productId = _uuid.v4(); // Generate a unique ID using UUID
//       adminServices.sellProduct(
//         id: productId, // Pass the generated ID
//         context: context,
//         name: productNameController.text,
//         deliverytime: deliverytimeController.text,
//         location: locationController.text,
//         description: descriptionController.text,
//         price: double.parse(priceController.text),
//         quantity: double.parse(quantityController.text),
//         category: category,
//         images: images,
//         foods: foods,
//       );
//     }
//   }

//   void addFoodItem() {
//     if (foodNameController.text.isNotEmpty &&
//         foodPriceController.text.isNotEmpty) {
//       setState(() {
//         foods.add(FoodItem(
//           id: _uuid.v4(), // Generate a unique ID for each FoodItem
//           name: foodNameController.text,
//           price: double.parse(foodPriceController.text),
//         ));
//         foodNameController.clear();
//         foodPriceController.clear();
//       });
//     }
//   }

//   void selectImages() async {
//     var res = await pickImages();
//     setState(() {
//       images = res;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(50),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               color: GlobalVariables.secondaryColor,
//             ),
//           ),
//           title: const Text(
//             'Add Restaurant',
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _addProductFormKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 images.isNotEmpty
//                     ? CarouselSlider(
//                         items: images.map(
//                           (i) {
//                             return Builder(
//                               builder: (BuildContext context) => Image.file(
//                                 i,
//                                 fit: BoxFit.cover,
//                                 height: 200,
//                               ),
//                             );
//                           },
//                         ).toList(),
//                         options: CarouselOptions(
//                           viewportFraction: 1,
//                           height: 200,
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: selectImages,
//                         child: DottedBorder(
//                           borderType: BorderType.RRect,
//                           radius: const Radius.circular(10),
//                           dashPattern: const [10, 4],
//                           strokeCap: StrokeCap.round,
//                           child: Container(
//                             width: double.infinity,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(
//                                   Icons.folder_open,
//                                   size: 40,
//                                 ),
//                                 const SizedBox(height: 15),
//                                 Text(
//                                   'Select Restaurant Images',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.grey.shade400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                   controller: productNameController,
//                   hintText: 'Restaurant Name',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: deliverytimeController,
//                   hintText: 'Delivery Time',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: locationController,
//                   hintText: 'Location',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: descriptionController,
//                   hintText: 'Description',
//                   maxLines: 7,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: priceController,
//                   hintText: 'Price',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: quantityController,
//                   hintText: 'Quantity',
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: DropdownButton(
//                     value: category,
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     items: productCategories.map((String item) {
//                       return DropdownMenuItem(
//                         value: item,
//                         child: Text(item),
//                       );
//                     }).toList(),
//                     onChanged: (String? newVal) {
//                       setState(() {
//                         category = newVal!;
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Food Items',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: foodNameController,
//                   hintText: 'Food Name',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   controller: foodPriceController,
//                   hintText: 'Food Price',
//                 ),
//                 const SizedBox(height: 10),
//                 CustomButton(
//                   text: 'Add Food Item',
//                   onTap: addFoodItem,
//                 ),
//                 const SizedBox(height: 20),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: foods.length,
//                   itemBuilder: (context, index) {
//                     final food = foods[index];
//                     return ListTile(
//                       title: Text(food.name),
//                       subtitle:
//                           Text('Price: \$${food.price.toStringAsFixed(2)}'),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           setState(() {
//                             foods.removeAt(index);
//                           });
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 CustomButton(
//                   text: 'Add',
//                   onTap: sellProduct,
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'dart:io';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:dotted_border/dotted_border.dart';
// // import 'package:flutter/material.dart';
// // import 'package:munchin_app/common/widgets/custom_button.dart';
// // import 'package:munchin_app/common/widgets/custom_textfield.dart';
// // import 'package:munchin_app/constants/global_variables.dart';
// // import 'package:munchin_app/constants/utils.dart';
// // import 'package:munchin_app/features/admin/services/admin_services.dart';
// // import 'package:munchin_app/models/product.dart';
// // import 'package:uuid/uuid.dart'; // Import for generating unique IDs

// // class AddProductScreen extends StatefulWidget {
// //   static const String routeName = '/add-product';
// //   const AddProductScreen({Key? key}) : super(key: key);

// //   @override
// //   State<AddProductScreen> createState() => _AddProductScreenState();
// // }

// // class _AddProductScreenState extends State<AddProductScreen> {
// //   final TextEditingController productNameController = TextEditingController();
// //   final TextEditingController descriptionController = TextEditingController();
// //   final TextEditingController priceController = TextEditingController();
// //   final TextEditingController quantityController = TextEditingController();
// //   final TextEditingController deliverytimeController = TextEditingController();
// //   final TextEditingController locationController = TextEditingController();
// //   final TextEditingController foodNameController = TextEditingController();
// //   final TextEditingController foodPriceController = TextEditingController();
// //   final AdminServices adminServices = AdminServices();

// //   String category = 'Restaurant';
// //   List<File> images = [];
// //   List<FoodItem> foods = [];
// //   final _addProductFormKey = GlobalKey<FormState>();

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     productNameController.dispose();
// //     descriptionController.dispose();
// //     priceController.dispose();
// //     quantityController.dispose();
// //     deliverytimeController.dispose();
// //     locationController.dispose();
// //     foodNameController.dispose();
// //     foodPriceController.dispose();
// //   }

// //   List<String> productCategories = [
// //     'Restaurant',
// //     'Cafe',
// //     'Lounge',
// //     'Khaja Ghar',
// //     'Diner',
// //     'Pub',
// //   ];

// //   final Uuid _uuid = Uuid();

// //   void sellProduct() {
// //     if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
// //       String productId = _uuid.v4(); // Generate a unique ID using UUID
// //       Product product = Product(
// //         id: productId,
// //         name: productNameController.text,
// //         deliverytime: deliverytimeController.text,
// //         location: locationController.text,
// //         description: descriptionController.text,
// //         price: double.parse(priceController.text),
// //         quantity: double.parse(quantityController.text),
// //         category: category,
// //         images: images
// //             .map((image) => image.path)
// //             .toList(), // Assuming image URLs are needed
// //         foods: foods,
// //       );

// //       print('Sending Product Data: ${product.toJson()}'); // Debug log

// //       adminServices.sellProduct(
// //         id: productId, // Pass the generated ID
// //         context: context,
// //         name: productNameController.text,
// //         deliverytime: deliverytimeController.text,
// //         location: locationController.text,
// //         description: descriptionController.text,
// //         price: double.parse(priceController.text),
// //         quantity: double.parse(quantityController.text),
// //         category: category,
// //         images: images,
// //         foods: foods,
// //       );
// //     }
// //   }

// //   void addFoodItem() {
// //     if (foodNameController.text.isNotEmpty &&
// //         foodPriceController.text.isNotEmpty) {
// //       setState(() {
// //         foods.add(FoodItem(
// //           id: _uuid.v4(), // Generate a unique ID for each FoodItem
// //           name: foodNameController.text,
// //           price: double.parse(foodPriceController.text),
// //         ));
// //         foodNameController.clear();
// //         foodPriceController.clear();
// //       });
// //     }
// //   }

// //   void selectImages() async {
// //     var res = await pickImages();
// //     setState(() {
// //       images = res;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: const Size.fromHeight(50),
// //         child: AppBar(
// //           flexibleSpace: Container(
// //             decoration: const BoxDecoration(
// //               color: GlobalVariables.secondaryColor,
// //             ),
// //           ),
// //           title: const Text(
// //             'Add Restaurant',
// //             style: TextStyle(
// //               color: Colors.black,
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Form(
// //           key: _addProductFormKey,
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //             child: Column(
// //               children: [
// //                 const SizedBox(height: 20),
// //                 images.isNotEmpty
// //                     ? CarouselSlider(
// //                         items: images.map(
// //                           (i) {
// //                             return Builder(
// //                               builder: (BuildContext context) => Image.file(
// //                                 i,
// //                                 fit: BoxFit.cover,
// //                                 height: 200,
// //                               ),
// //                             );
// //                           },
// //                         ).toList(),
// //                         options: CarouselOptions(
// //                           viewportFraction: 1,
// //                           height: 200,
// //                         ),
// //                       )
// //                     : GestureDetector(
// //                         onTap: selectImages,
// //                         child: DottedBorder(
// //                           borderType: BorderType.RRect,
// //                           radius: const Radius.circular(10),
// //                           dashPattern: const [10, 4],
// //                           strokeCap: StrokeCap.round,
// //                           child: Container(
// //                             width: double.infinity,
// //                             height: 150,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(10),
// //                             ),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 const Icon(
// //                                   Icons.folder_open,
// //                                   size: 40,
// //                                 ),
// //                                 const SizedBox(height: 15),
// //                                 Text(
// //                                   'Select Restaurant Images',
// //                                   style: TextStyle(
// //                                     fontSize: 15,
// //                                     color: Colors.grey.shade400,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                 const SizedBox(height: 30),
// //                 CustomTextField(
// //                   controller: productNameController,
// //                   hintText: 'Restaurant Name',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: deliverytimeController,
// //                   hintText: 'Delivery Time',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: locationController,
// //                   hintText: 'Location',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: descriptionController,
// //                   hintText: 'Description',
// //                   maxLines: 7,
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: priceController,
// //                   hintText: 'Price',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: quantityController,
// //                   hintText: 'Quantity',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: DropdownButton<String>(
// //                     value: category,
// //                     icon: const Icon(Icons.keyboard_arrow_down),
// //                     items: productCategories.map((String item) {
// //                       return DropdownMenuItem<String>(
// //                         value: item,
// //                         child: Text(item),
// //                       );
// //                     }).toList(),
// //                     onChanged: (String? newVal) {
// //                       setState(() {
// //                         category = newVal!;
// //                       });
// //                     },
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //                 Text(
// //                   'Food Items',
// //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: foodNameController,
// //                   hintText: 'Food Name',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomTextField(
// //                   controller: foodPriceController,
// //                   hintText: 'Food Price',
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomButton(
// //                   text: 'Add Food Item',
// //                   onTap: addFoodItem,
// //                 ),
// //                 const SizedBox(height: 20),
// //                 ListView.builder(
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   itemCount: foods.length,
// //                   itemBuilder: (context, index) {
// //                     final food = foods[index];
// //                     return ListTile(
// //                       title: Text(food.name),
// //                       subtitle:
// //                           Text('Price: \$${food.price.toStringAsFixed(2)}'),
// //                       trailing: IconButton(
// //                         icon: const Icon(Icons.delete, color: Colors.red),
// //                         onPressed: () {
// //                           setState(() {
// //                             foods.removeAt(index);
// //                           });
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 ),
// //                 const SizedBox(height: 10),
// //                 CustomButton(
// //                   text: 'Add',
// //                   onTap: sellProduct,
// //                 ),
// //                 const SizedBox(height: 20),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:munchin_app/common/widgets/custom_button.dart';
import 'package:munchin_app/common/widgets/custom_textfield.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/constants/utils.dart';
import 'package:munchin_app/features/admin/services/admin_services.dart';
import 'package:munchin_app/models/product.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController deliverytimeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodPriceController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = 'Restaurant';
  List<File> images = [];
  List<FoodItem> foods = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    deliverytimeController.dispose();
    locationController.dispose();
    foodNameController.dispose();
    foodPriceController.dispose();
  }

  List<String> productCategories = [
    'Restaurant',
    'Cafe',
    'Lounge',
    'Khaja Ghar',
    'Diner',
    'Pub',
  ];

  int _uniqueIdCounter = 0;

  int generateUniqueId() {
    // Using current time in milliseconds since epoch as the base
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    // Increment the counter to ensure uniqueness within the same millisecond
    _uniqueIdCounter++;

    // Combine timestamp with the counter for a unique ID
    return timestamp + _uniqueIdCounter;
  }

  // void sellProduct() {
  //   if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
  //     int productId = generateUniqueId(); // Generate a unique ID
  //     print(productId);
  //     adminServices.sellProduct(
  //       id: productId, // Pass the generated ID
  //       context: context,
  //       name: productNameController.text,
  //       deliverytime: deliverytimeController.text,
  //       location: locationController.text,
  //       description: descriptionController.text,
  //       price: double.parse(priceController.text),
  //       quantity: double.parse(quantityController.text),
  //       category: category,
  //       images: images,
  //       foods: foods,
  //     );
  //   }
  // }
  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      try {
        int productId = generateUniqueId(); // Generate a unique ID
        adminServices.sellProduct(
          id: productId, // Pass the generated ID
          context: context,
          name: productNameController.text,
          deliverytime: deliverytimeController.text,
          location: locationController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: category,
          images: images,
          foods: foods,
        );
      } catch (e) {
        // Handle parsing errors or other issues
        print('Error parsing numbers: $e');
        // Optionally show a user-friendly message
      }
    }
  }

  void addFoodItem() {
    if (foodNameController.text.isNotEmpty &&
        foodPriceController.text.isNotEmpty) {
      setState(() {
        foods.add(FoodItem(
          name: foodNameController.text,
          price: double.parse(foodPriceController.text),
        ));
        foodNameController.clear();
        foodPriceController.clear();
      });
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.secondaryColor,
            ),
          ),
          title: const Text(
            'Add Restaurant',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Select Restaurant Images',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Restaurant Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: deliverytimeController,
                  hintText: 'Delivery Time',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: locationController,
                  hintText: 'location',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Average waiting time',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Staff',
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Food Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: foodNameController,
                  hintText: 'Food Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: foodPriceController,
                  hintText: 'Food Price',
                  // keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Add Food Item',
                  onTap: addFoodItem,
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return ListTile(
                      title: Text(food.name),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price: ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text("Rs ${food.price.toStringAsFixed(2)}")
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            foods.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Add',
                  onTap: sellProduct,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
