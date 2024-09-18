// import 'package:flutter/material.dart';
// import 'package:munchin_app/app/colors/app_color.dart';
// import 'package:munchin_app/app/dimensions/dimensions.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';
// import 'package:munchin_app/constants/global_variables.dart';
// import 'package:munchin_app/repository/recommendation_repo.dart';
// import 'package:provider/provider.dart';

// import '../../../providers/user_provider.dart';
// import '../../search/screens/search_screen.dart';

// class TopBar extends StatefulWidget {
//   const TopBar({Key? key}) : super(key: key);

//   @override
//   State<TopBar> createState() => _TopBarState();
// }

// class _TopBarState extends State<TopBar> {
//   void navigateToSearchScreen(String query) {
//     Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
//     final prov = Provider.of<RecommendationRepo>(context, listen: false);
//     prov.getRecommendations(query);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserProvider>(context).user;
//     return Container(
//       color: Color(0xFff1f5f9),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           vSizedBox0,
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             // color: Colors.blue.shade400,
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   'Hello, ${user.name[0].toUpperCase()}${user.name.substring(1)}',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           // Text(
//           //   "Ready to order ",
//           //   style: AppTextStyles.subTitle,
//           // ),
//           // vSizedBox0,
//           SizedBox(
//             height: 42,
//             child: Material(
//               borderRadius: BorderRadius.circular(7),
//               elevation: 1,
//               child: TextFormField(
//                 onFieldSubmitted: navigateToSearchScreen,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                   contentPadding: const EdgeInsets.symmetric(vertical: 15),
//                   hintText: " Search dishes, restaurants ",
//                   hintStyle: AppTextStyles.secondaryheader,
//                   prefixIcon: const Icon(Icons.search_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   prefixIconColor: Colors.black45,
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(
//                       color: GlobalValue.primaryColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/app/colors/app_color.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/repository/recommendation_repo.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../search/screens/search_screen.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  void navigateToSearchScreen(String query) {
    if (query.isNotEmpty) {
      final prov = Provider.of<RecommendationRepo>(context, listen: false);
      prov.getRecommendations(query); // Fetch recommendations based on the query
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      color: Color(0xFff1f5f9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSizedBox0,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: <Widget>[
                Text(
                  'Hello, ${user.name[0].toUpperCase()}${user.name.substring(1)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 42,
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 1,
              child: TextFormField(
                onFieldSubmitted: navigateToSearchScreen,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  hintText: "Search dishes, restaurants",
                  hintStyle: AppTextStyles.secondaryheader,
                  prefixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIconColor: Colors.black45,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: GlobalValue.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
