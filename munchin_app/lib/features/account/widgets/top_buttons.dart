import 'package:flutter/material.dart';
import 'package:munchin_app/features/account/screens/Contact_us.dart';


class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ContactUs()));
        },
        child: Text(
          "Contact-Us",
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
