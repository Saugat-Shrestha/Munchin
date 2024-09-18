// import 'package:flutter/material.dart';
// import 'package:munchin_app/constants/global_variables.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onTap;
//   final Color? color;
//   const CustomButton({
//     Key? key,
//     required this.text,
//     required this.onTap,
//     this.color,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text(
//         text,
//         style: TextStyle(
//           color: color == null ? Colors.white : Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(double.infinity, 50),
//         backgroundColor: GlobalVariables.selectednavBarColor,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final bool isLoading; // Add a boolean to indicate loading state

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
    this.isLoading = false, // Default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              text,
              style: TextStyle(
                color: color == null ? Colors.white : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
      onPressed: isLoading ? null : onTap, // Disable button when loading
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: GlobalVariables.selectednavBarColor,
      ),
    );
  }
}
