// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:munchin_app/app/dimensions/dimensions.dart';
// import 'package:munchin_app/app/styles/app_textstyles.dart';
// import 'package:munchin_app/common/widgets/FAQ.dart';
// import 'package:munchin_app/features/account/components/middle_profile.dart';
// import 'package:munchin_app/features/account/components/more.dart';
// import 'package:munchin_app/features/account/components/top_profile.dart';

// import 'package:provider/provider.dart';

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfff5f6fb),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "My Profile",
//           selectionColor: Color(0xfff5f6fb),
//           style: AppTextStyles.topheader,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           // padding: EdgeInsets.symmetric(
//           //   horizontal: 20,
//           // ),
//           child: Column(
//             children: [
//               TopProfile(),
//               // vSizedBox1,
//               middleProfile(),
//               // vSizedBox0,

//               // foodOrders(),
//               // vSizedBox0,
//               more(),
//               vSizedBox0,
//               // Text('ffff')
//               // FutureBuilder(
//               //   future: sharedPreferencesToken.getUser(),
//               //   builder: (context, snapshot) {
//               //     if (snapshot.hasData) {
//               //       UserTokenModel userTokenModel =
//               //           snapshot.data as UserTokenModel;
//               //       return Text(userTokenModel.token!);
//               //     }
//               //     return Container();
//               //   },
//               // )

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:munchin_app/app/styles/app_textstyles.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/account/components/top_profile.dart';
import 'package:munchin_app/features/account/components/middle_profile.dart';
import 'package:munchin_app/features/account/components/more.dart';
import 'package:munchin_app/app/dimensions/dimensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // Method to delete the account

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fb),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Profile",
          style: AppTextStyles.topheader,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopProfile(),
            middleProfile(),
            more(),
            const Gap(20), // Adds some space before the button
          ],
        ),
      ),
    );
  }
}
