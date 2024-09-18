import 'package:flutter/material.dart';
import 'package:munchin_app/providers/user_provider.dart';
import 'package:provider/provider.dart';


class BelowAppBar extends StatelessWidget {
  const BelowAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      color: Color(0xFff1f5f9),
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              height: 18,
              width: 18,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
