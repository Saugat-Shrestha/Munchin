// import 'package:flutter/material.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';
// import 'package:munchin_app/constants/global_variables.dart';
// import 'package:munchin_app/features/home/screens/topbar.dart';
// import 'package:munchin_app/features/home/widgets/carousel_image.dart';
// import 'package:munchin_app/features/home/widgets/deal_of_day.dart';
// import 'package:munchin_app/features/home/widgets/demo_recommendation.dart';
// import 'package:munchin_app/features/home/widgets/top_categories.dart';
// import 'package:munchin_app/features/recommendation_screen/recommendation_screen.dart';
// import 'package:munchin_app/features/search/screens/search_screen.dart';
// import 'package:munchin_app/repository/recommendation_repo.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   void navigateToSearchScreen(String query) {
//     Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final user = Provider.of<UserProvider>(context).user;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(0),
//         child: AppBar(
//           backgroundColor: Color(0xFff1f5f9),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               color: GlobalVariables.selectednavBarColor,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           color: Color(0xFff1f5f9),
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TopBar(),
//               SizedBox(height: 30),
//               // RecommendationPart(),
//               Text(
//                 "Recommendated for you",
//                 style: AppTextStyles.subTitle,
//               ),
//               SizedBox(height: 10),
//               Consumer<RecommendationRepo>(
//                 builder: (context, value, child) {
//                   // Check if recommendations data is empty
//                   if (value.recommendations.isEmpty) {
//                     // Show demo data or placeholder when recommendations are empty
//                     return Column(
//                       children: [
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.08,
//                           child: ListView.separated(
//                             separatorBuilder: (context, index) => SizedBox(
//                               width: 20,
//                             ),
//                             scrollDirection: Axis.horizontal,
//                             shrinkWrap: true,
//                             itemCount: recommendedjson
//                                 .length, // Example count for demo data
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.grey,
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     recommendedjson[index]["name"],
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     // Show actual recommendations when available
//                     return Container(
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       child: ListView.separated(
//                         separatorBuilder: (context, index) =>
//                             SizedBox(width: 20),
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: value.recommendations.length,
//                         itemBuilder: (context, index) {
//                           final data = value.recommendations;
//                           return Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.grey,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 data[index].toString(),
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     );
//                   }
//                 },
//               ),

//               SizedBox(height: 30),
//               CarouselImage(),
//               SizedBox(height: 20),
//               TopCategories(),
//               SizedBox(height: 20),
//               Text(
//                 "Restaurants",
//                 style: AppTextStyles.subTitle,
//               ),
//               SizedBox(height: 20),

//               DealOfDay(),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/home/screens/topbar.dart';
import 'package:munchin_app/features/home/widgets/carousel_image.dart';
import 'package:munchin_app/features/home/widgets/deal_of_day.dart';
import 'package:munchin_app/features/home/widgets/demo_recommendation.dart';
import 'package:munchin_app/features/home/widgets/top_categories.dart';
import 'package:munchin_app/repository/recommendation_repo.dart';
import 'package:munchin_app/features/search/screens/search_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFff1f5f9),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: GlobalVariables.selectednavBarColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFff1f5f9),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),
              SizedBox(height: 30),
              Text(
                "Recommended for you",
                style: AppTextStyles.subTitle,
              ),
              SizedBox(height: 10),
              Consumer<RecommendationRepo>(
                builder: (context, value, child) {
                  // Check if recommendations data is empty
                  if (value.recommendations.isEmpty) {
                    // Show demo data or placeholder when recommendations are empty
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: recommendedjson
                            .length, // Example count for demo data
                        itemBuilder: (context, index) {
                          final itemName = recommendedjson[index]["name"];
                          return GestureDetector(
                            onTap: () => navigateToSearchScreen(itemName),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  itemName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    // Show actual recommendations when available
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: value.recommendations.length,
                        itemBuilder: (context, index) {
                          final itemName =
                              value.recommendations[index].toString();
                          return GestureDetector(
                            onTap: () => navigateToSearchScreen(itemName),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                              child: Center(
                                child: Text(
                                  itemName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              CarouselImage(),
              SizedBox(height: 20),
              TopCategories(),
              SizedBox(height: 20),
              Text(
                "Restaurants",
                style: AppTextStyles.subTitle,
              ),
              SizedBox(height: 20),
              DealOfDay(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
