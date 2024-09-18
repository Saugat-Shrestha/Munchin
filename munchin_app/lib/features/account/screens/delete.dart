import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:munchin_app/constants/global_variables.dart';
import 'package:munchin_app/features/account/services/account_services.dart';
import 'package:munchin_app/features/account/widgets/below_app_bar.dart';
import 'package:munchin_app/features/account/widgets/top_buttons.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Color(0xFff1f5f9),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: GlobalVariables.secondaryColor),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Munchin",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => AccountServices().logOut(context),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFff1f5f9),
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            BelowAppBar(),
            SizedBox(height: 20),
            TopButtons(),
            SizedBox(height: 20),
            // Orders(),
          ],
        ),
      ),
    );
  }
}
