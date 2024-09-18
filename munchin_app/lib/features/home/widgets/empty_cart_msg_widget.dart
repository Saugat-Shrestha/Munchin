import 'package:flutter/material.dart';

class EmptyCartMsgWidget extends StatelessWidget {
  const EmptyCartMsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: SizedBox(
      height: size.height * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Your cart is empty',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/actual-home',
                );
              },
              child: const Text('Order now')),
        ],
      ),
    ));
  }
}
