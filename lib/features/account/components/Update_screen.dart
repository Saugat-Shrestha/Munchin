// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:munchin_app/app/colors/app_color.dart';
// import 'package:munchin_app/app/dimensions/dimensions.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';

// import 'package:provider/provider.dart';

// class UpdateScreen extends StatefulWidget {
//   const UpdateScreen({super.key});

//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }

// class _UpdateScreenState extends State<UpdateScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   final GlobalKey<FormState> _key = GlobalKey();
//   final TextEditingController usernamecontroller = TextEditingController();
//   final TextEditingController addresscontroller = TextEditingController();
//   final TextEditingController phonecontroller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final userUpdateProvider = Provider.of<UserUpdateProvider>(context);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Container(
//           color: GlobalValue.chatSenderColor,
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey.shade400)),
//                 child: Form(
//                   key: _key,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("User Name", style: AppTextStyles.authheader),
//                         vSizedBox1,
//                         TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter case name";
//                             }
//                             return null;
//                           },
//                           controller: usernamecontroller,
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade300,
//                             hintText: "User Name",
//                             border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.grey.shade100),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         vSizedBox1,
//                         Text("Address", style: AppTextStyles.authheader),
//                         vSizedBox1,
//                         TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter case name";
//                             }
//                             return null;
//                           },
//                           controller: addresscontroller,
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade300,
//                             hintText: "User Name",
//                             border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.grey.shade100),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         vSizedBox1,
//                         Text("Phone", style: AppTextStyles.authheader),
//                         vSizedBox1,
//                         TextFormField(
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter case name";
//                             }
//                             return null;
//                           },
//                           controller: phonecontroller,
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade300,
//                             hintText: "User Name",
//                             border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.grey.shade100),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                         AppButton2(
//                           onPressed: () {
//                             if (_key.currentState!.validate()) {
//                               userUpdateProvider.updateAlbum(
//                                 usernamecontroller.text,
//                                 addresscontroller.text,
//                                 phonecontroller.text,
//                               );
//                             }
//                             Navigator.pop(context);
//                           },
//                           buttonColor: GlobalValue.primaryColor,
//                           buttonText: 'Edit Case',
//                           buttonTxtColor: Colors.white,
//                         ),
//                         vSizedBox0,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
