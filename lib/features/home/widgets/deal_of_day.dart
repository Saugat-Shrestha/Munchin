// import 'package:flutter/material.dart';
// import 'package:munchin_app/features/home/services/home_services.dart';
// import 'package:munchin_app/features/product_details/screens/product_details_screen.dart';
// import 'package:munchin_app/models/product.dart';

// class DealOfDay extends StatefulWidget {
//   const DealOfDay({super.key});

//   @override
//   State<DealOfDay> createState() => _DealOfDayState();
// }

// class _DealOfDayState extends State<DealOfDay> {
//   Product? product;
//   final HomeServices homeServices = HomeServices();

//   @override
//   void initState() {
//     super.initState();
//     fetchImages();
//     fetchDealOfDay();
//   }

//   void fetchDealOfDay() async {
//     product = await homeServices.fetchDealOfDay(context: context);
//     setState(() {});
//   }

//   List products = [];

//   void fetchImages() async {
//     products = await homeServices.fetchAllProducts();
//     setState(() {});
//   }

//   void navigateToDetailScreen(Product? product) {
//     Navigator.pushNamed(
//       context,
//       ProductDetailScreen.routeName,
//       arguments: product,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => SizedBox(
//         height: 10,
//       ),
//       shrinkWrap: true,
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             navigateToDetailScreen(Product.fromJson(products[index]));
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   child: AspectRatio(
//                     aspectRatio: 16 / 10,
//                     child: Image.network(
//                       products[index]['images'][0],
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "Price : ${products[index]["price"]}",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   "Brand Name : ${products[index]['name']}",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';
// import 'package:munchin_app/features/home/services/home_services.dart';
// import 'package:munchin_app/features/home/widgets/FoodItemDetails.dart';
// import 'package:munchin_app/features/home/widgets/productDetailsScreen.dart';
// // import 'package:munchin_app/features/product_details/screens/product_details_screen.dart';
// import 'package:munchin_app/models/product.dart';

// class DealOfDay extends StatefulWidget {
//   const DealOfDay({Key? key}) : super(key: key);

//   @override
//   State<DealOfDay> createState() => _DealOfDayState();
// }

// class _DealOfDayState extends State<DealOfDay> {
//   Product? product;
//   List<Product> products = [];
//   final HomeServices homeServices = HomeServices();

//   @override
//   void initState() {
//     super.initState();
//     fetchDealOfDay();
//     fetchImages();
//   }

//   void fetchDealOfDay() async {
//     product = await homeServices.fetchDealOfDay(context: context);
//     setState(() {});
//   }

//   void fetchImages() async {
//     products = await homeServices.fetchAllProducts();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) => SizedBox(height: 10),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final product = products[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => FoodItemss(product: product),
//               ),
//             );
//           },
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.white,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 130,
//                   width: MediaQuery.sizeOf(context).width,
//                   child: Image.network(
//                     product.images.isNotEmpty ? product.images[0] : '',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 SizedBox(height: 5),
//                 Text(
//                   " ${product.name}",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   " ${product.description}",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//                 SizedBox(height: 5),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/features/home/services/home_services.dart';
import 'package:munchin_app/features/home/widgets/FoodItemDetails.dart';
import 'package:munchin_app/features/home/widgets/productDetailsScreen.dart';
// import 'package:munchin_app/features/product_details/screens/product_details_screen.dart';
import 'package:munchin_app/models/product.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  List<Product> products = [];
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
    fetchImages();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void fetchImages() async {
    products = await homeServices.fetchAllProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodItemss(product: product),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.network(
                    product.images.isNotEmpty ? product.images[0] : '',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 5),
                Text(
                  " ${product.name}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  " ${product.description}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }
}