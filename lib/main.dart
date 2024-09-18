// import 'package:flutter/material.dart';
// import 'package:munchin_app/common/widgets/bottom_bar.dart';
// import 'package:munchin_app/constants/global_variables.dart';
// import 'package:munchin_app/features/admin/screens/admin_screen.dart';
// import 'package:munchin_app/features/auth/screens/auth_screen.dart';
// import 'package:munchin_app/features/auth/services/auth_service.dart';
// import 'package:munchin_app/features/settings/components/postdata.dart';
// import 'package:munchin_app/features/splash_screen/splash_screen.dart';
// import 'package:munchin_app/providers/check_box_provider.dart';
// import 'package:munchin_app/providers/user_provider.dart';
// import 'package:munchin_app/repository/recommendation_repo.dart';
// import 'package:munchin_app/router.dart';
// import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
// import 'package:provider/provider.dart';

// import 'package:khalti_flutter/khalti_flutter.dart';

// void main() {
//   runApp(
//     MultiProvider(providers: [
//       ChangeNotifierProvider(
//         create: (context) => UserProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => UserProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => CheckBoxProvider(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => RecommendationRepo(),
//       ),
//       ChangeNotifierProvider(
//         create: (context) => PostDataProvider(),
//       ),

//       // ChangeNotifierProvider(
//       //   create: (context) => RecommendationProvider(),
//       // ),
//     ], child: const MyApp()),
//   );
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final AuthService authService = AuthService();

//   @override
//   void initState() {
//     super.initState();
//     authService.getUserData(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KhaltiScope(
//         publicKey: 'test_public_key_307850aa01dd432799359e427571f6a7',
//         enabledDebugging: true,
//         builder: (context, navKey) {
//           return MaterialApp(
//             initialRoute: SplashScreen.routeName,
//             navigatorKey: navKey,
//             localizationsDelegates: const [
//               KhaltiLocalizations.delegate,
//             ],
//             debugShowCheckedModeBanner: false,
//             title: 'Munchin',
//             theme: ThemeData(
//               scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//               colorScheme: const ColorScheme.light(
//                 primary: Color(0xff005288),
//               ),
//               appBarTheme: const AppBarTheme(
//                 elevation: 0,
//                 iconTheme: IconThemeData(
//                   color: Colors.black,
//                 ),
//               ),
//               useMaterial3: true, // can remove this line
//             ),
//             onGenerateRoute: (settings) => generateRoute(settings),
//             home: Provider.of<UserProvider>(context).user.token.isNotEmpty
//                 // ? Provider.of<UserProvider>(context).user.type == 'user'
//                 ? const BottomBar()
//                 // ? const AdminScreen()
//                 : AuthScreen(),
//           );
//         });
//   }
// }

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:munchin_app/common/widgets/bottom_bar.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/admin/screens/admin_screen.dart';
import 'package:munchin_app/features/auth/screens/auth_screen.dart';
import 'package:munchin_app/features/auth/services/auth_service.dart';
import 'package:munchin_app/features/settings/components/postdata.dart';
import 'package:munchin_app/features/splash_screen/splash_screen.dart';
import 'package:munchin_app/providers/check_box_provider.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:munchin_app/repository/recommendation_repo.dart';
import 'package:munchin_app/router.dart';
import 'package:persistent_shopping_cart/persistent_shopping_cart.dart';
import 'package:provider/provider.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  // Ensure proper initialization of Flutter binding
  WidgetsFlutterBinding.ensureInitialized();

  // Set custom directory for Hive
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init('${appDocDir.path}/hive_boxes');

  // Initialize PersistentShoppingCart (which uses Hive)
  await PersistentShoppingCart().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckBoxProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecommendationRepo(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostDataProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_307850aa01dd432799359e427571f6a7',
      enabledDebugging: true,
      builder: (context, navKey) {
        return MaterialApp(
          initialRoute: SplashScreen.routeName,
          navigatorKey: navKey,
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'Munchin',
          theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
              primary: Color(0xff005288),
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            useMaterial3: true, // This can be adjusted based on your needs
          ),
          onGenerateRoute: (settings) => generateRoute(settings),
          home: Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? const BottomBar()
              : AuthScreen(),
        );
      },
    );
  }
}
