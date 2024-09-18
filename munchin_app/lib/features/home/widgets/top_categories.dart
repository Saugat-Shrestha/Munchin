import 'package:flutter/material.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/home/screens/category_deals_screen.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What's on your mind?",
          style: AppTextStyles.subTitle,
        ),
        vSizedBox0,
        Container(
          height: 180,
          color: Color(0xFff1f5f9),
          child: SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: GlobalVariables.categoryImages.length,
              scrollDirection: Axis.horizontal,
              itemExtent: 155,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () => navigateToCategoryPage(
                      context,
                      GlobalVariables.categoryImages[index]['title']!,
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                GlobalVariables.categoryImages[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          vSizedBox0,
                          Text(
                            GlobalVariables.categoryImages[index]['title']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              // color: Color.fromARGB(255, 43, 43, 43),
                            ),
                          ),
                        ],
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
