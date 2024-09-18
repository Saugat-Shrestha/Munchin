// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:munchin_app/app/dimensions/dimensions.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';
// import 'package:munchin_app/common/widgets/FAQ_components.dart';

// class FAQ extends StatefulWidget {
//   const FAQ({super.key});

//   @override
//   State<FAQ> createState() => _FAQState();
// }

// class _FAQState extends State<FAQ> {
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> _item = List.generate(
//         10,
//         (index) => {
//               // "id": index,
//               // "title": "Item $index",
//               // "content": " this is the main content of item $index",
//             });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Frequently Asked Questions",
//           style: AppTextStyles.secondaryheader,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: 10,
//           // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               vSizedBox1,
//               SizedBox(
//                 height: MediaQuery.sizeOf(context).height * 0.8,
//                 child: ListView.builder(
//                   itemCount: _item.length,
//                   itemBuilder: (_, index) {
//                     final item = _item[index];
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Card(
//                         key: PageStorageKey(FAQData[index]),
//                         color: Colors.white,
//                         elevation: 4,
//                         child: ExpansionTile(
//                           iconColor: Colors.black,
//                           childrenPadding: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 20),
//                           expandedCrossAxisAlignment: CrossAxisAlignment.end,
//                           title: Row(
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Colors.green,
//                                 ),
//                                 child: Icon(
//                                   Icons.question_mark_outlined,
//                                   color: Colors.white,
//                                   size: 20,
//                                 ),
//                               ),
//                               Gap(10),
//                               Expanded(
//                                 child: Text(
//                                   textAlign: TextAlign.start,
//                                   FAQData[index]["title"].toString(),
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           children: [
//                             Text(
//                               textAlign: TextAlign.start,
//                               FAQData[index]["content"].toString(),
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             // IconButton(
//                             //     onPressed: () => _removeItem(index),
//                             //     icon: Icon(
//                             //       Icons.delete,
//                             //       color: Colors.red,
//                             //     ))
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:munchin_app/app/styles/app_textstyles.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final List<Map<String, dynamic>> FAQData = [
    {
      "title": "Do you prepare food ?",
      "content":
          "No, we don't prepare food but we delivery foods from any of our online food partner restaurants listed on our system.",
    },
    {
      "title": "Do I need to signup to place an order ?",
      "content":
          "Yes, you need to signup and then enter a valid contact number, email address and delivery address.",
    },
    {
      "title": "Can I cancel the order ?",
      "content":
          "You can cancel the order only if the restaurant has not prepared the ordered food.",
    },
    {
      "title": "Can I order from multiple restaurants in single order ?",
      "content":
          "No, you cannot order from multiple restaurants at once. You need to place another order for ordering from another restaurant.",
    },
    {
      "title": "How much time does it take for delivery ?",
      "content":
          "The estimated delivery time is within 45 to an hour. Some factors like traffic jams and weather condition might affect the delivery time.",
    },
    {
      "title": "Do you charge for delivery ?",
      "content":
          "Our Delivery Charge is Rs.100 within pokhara city and depending on Order Size and distance we may charge extra for delivery. We charge extra Rs.150 for delivery in Lekhnath and Hemja. ",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          "Frequently Asked Questions",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox1,
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: FAQData.length,
                  itemBuilder: (_, index) {
                    final item = FAQData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        key: PageStorageKey(item),
                        color: Colors.white,
                        elevation: 4,
                        child: ExpansionTile(
                          iconColor: Colors.black,
                          childrenPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.question_mark_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Gap(10),
                              Expanded(
                                child: Text(
                                  textAlign: TextAlign.start,
                                  item["title"].toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              item["content"].toString(),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
