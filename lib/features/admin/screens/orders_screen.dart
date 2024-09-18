// import 'package:flutter/material.dart';
// import 'package:munchin_app/common/widgets/loader.dart';
// import 'package:munchin_app/features/account/widgets/single_product.dart';
// import 'package:munchin_app/features/admin/services/admin_services.dart';
// import 'package:munchin_app/features/order_details/screens/order_details.dart';
// import 'package:munchin_app/models/order.dart';

// class OrdersScreen extends StatefulWidget {
//   const OrdersScreen({Key? key}) : super(key: key);

//   @override
//   State<OrdersScreen> createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//   // List<Order>? orders;
//   List? orders;
//   final AdminServices adminServices = AdminServices();

//   @override
//   void initState() {
//     super.initState();
//     fetchOrders();
//   }

//   void fetchOrders() async {
//     orders = await adminServices.fetchAllOrders(context);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return orders == null
//         ? const Loader()
//         : Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 20,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Ordered List",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 20,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     itemCount: orders!.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2),
//                     itemBuilder: (context, index) {
//                       final orderData = orders![index];
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             OrderDetailScreen.routeName,
//                             arguments: orderData,
//                           );
//                         },
//                         child: SizedBox(
//                           height: 140,
//                           child: Container(
//                             padding: EdgeInsets.all(8),
//                             // child: SingleProduct(
//                             //   image: orderData.products[0].images[0],
//                             // ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:munchin_app/features/account/components/admin_order_provider.dart';
import 'package:munchin_app/features/account/components/order_provider.dart';
import 'package:munchin_app/features/account/components/ordermodel.dart';
import 'package:munchin_app/features/home/widgets/order_admin_post.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late Future<List<Order>> futureOrders;
  final ApiServicess apiService = ApiServicess();
  final ApiServiced apiServiced = ApiServiced();
  @override
  void initState() {
    super.initState();
    futureOrders = apiService.fetchOrders();
  }

  Future<void> _changeOrderStatus(String orderId, int newStatus) async {
    try {
      await apiServiced.changeOrderStatus(orderId, newStatus);
      // Refresh the orders after the status change
      setState(() {
        futureOrders = apiService.fetchOrders();
      });
    } catch (e) {
      print(e);
      // Handle errors, e.g., show a SnackBar with the error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to change order status: $e'),
      ));
    }
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd, HH:mm');
    return formatter.format(dateTime);
  }

  String getStatusText(int status) {
    return status == 0 ? 'Not Delivered' : 'Delivered';
  }

  String _selectedName = 'Select a name'; // Default message

  void _handleMenuSelection(String selectedName) {
    setState(() {
      _selectedName =
          'Order is assigned to $selectedName'; // Update the message
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder<List<Order>>(
        future: futureOrders,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Order order = snapshot.data![index];
                return Card(
                  elevation: 5, // Increase elevation to add shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                    side: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1), // Optional: Border color and width
                  ),
                  shadowColor: Colors.grey.withOpacity(0.5),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order ID:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          " ${order.id}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Rs ${order.totalPrice}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "${getStatusText(order.status)}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ordered At: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              ' ${formatDate(order.orderedAt)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: order.status == 1
                                  ? null
                                  : () {
                                      _changeOrderStatus(order.id,
                                          1); // Change order status to 'Delivered'
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: order.status == 1
                                    ? Colors.grey
                                    : Colors
                                        .blue, // Change button color if disabled
                              ),
                              child: Text(
                                order.status == 1
                                    ? "Order Delivered"
                                    : "Deliver Order",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            )

                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     ElevatedButton(
                            //       onPressed: () {},
                            //       child: PopupMenuButton<String>(
                            //         onSelected: _handleMenuSelection,
                            //         itemBuilder: (BuildContext context) {
                            //           return {'Sumit', 'Kimara', 'Saugat'}
                            //               .map((String name) {
                            //             return PopupMenuItem<String>(
                            //               value: name,
                            //               child: Text(name),
                            //             );
                            //           }).toList();
                            //         },
                            //         child: Text('Select a name'),
                            //       ),
                            //       style: ElevatedButton.styleFrom(
                            //         minimumSize: Size(200, 50),
                            //         textStyle: TextStyle(fontSize: 16),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //         height:
                            //             20), // Space between button and text
                            //     Text(
                            //       _selectedName,
                            //       style: TextStyle(
                            //           fontSize: 18,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      // You can add more details or navigate to a new screen with order details
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
