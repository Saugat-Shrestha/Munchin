// import 'package:flutter/material.dart';
// import 'package:munchin_app/app/colors/app_color.dart';

// class AppTextField extends StatelessWidget {
//   const AppTextField(
//       {super.key,
//       this.textEditingController,
//       required this.focusNode,
//       required this.keyboardType,
//       required this.onValidator,
//       required this.onFiledSubmittedValue,
//       required this.enable,
//       required this.icon,
//       required this.hintText,
//       required this.labelText,
//       this.obsecureText = false,
//       this.prefixIcon = false,
//       this.suffixIcon = false,
//       required this.autofocus});

//   final TextEditingController? textEditingController;
//   final FocusNode focusNode;
//   final TextInputType keyboardType;
//   final FormFieldValidator onValidator;
//   final FormFieldSetter onFiledSubmittedValue;
//   final bool enable, autofocus;
//   final Widget icon;
//   final bool suffixIcon;
//   final bool prefixIcon;
//   final String hintText;
//   final String labelText;
//   final bool obsecureText;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: textEditingController,
//       // cursorColor: AppColors.primaryColor,
//       focusNode: focusNode,
//       keyboardType: keyboardType,
//       validator: onValidator,
//       onFieldSubmitted: onFiledSubmittedValue,
//       obscureText: obsecureText,
//       obscuringCharacter: "*",
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         suffixIcon: suffixIcon ? icon : null,
//         prefixIcon: prefixIcon ? icon : null,
//         hintText: hintText,
//         labelStyle: TextStyle(
//           color: Colors.black,
//         ),
//         label: Text(labelText),
//         hintStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           color: Colors.grey.shade600,
//         ),
//         // suffixIconColor: AppColors.iconColor,
//         // fillColor: AppColors.thirdColor,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//             color: Colors.grey.shade400,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red.shade900,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: GlobalValue.primaryColor,
//           ),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         contentPadding: const EdgeInsets.all(16),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:munchin_app/app/colors/app_color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.textEditingController,
    required this.focusNode,
    required this.keyboardType,
    required this.onValidator,
    required this.onFiledSubmittedValue,
    required this.enable,
    required this.icon,
    required this.hintText,
    required this.labelText,
    this.obsecureText = false,
    this.prefixIcon = false,
    this.suffixIcon = false,
    this.autofocus = false,
    this.dropdownItems, // New parameter for dropdown items
  });

  final TextEditingController? textEditingController;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final FormFieldValidator onValidator;
  final FormFieldSetter onFiledSubmittedValue;
  final bool enable, autofocus;
  final Widget icon;
  final bool suffixIcon;
  final bool prefixIcon;
  final String hintText;
  final String labelText;
  final bool obsecureText;
  final List<String>? dropdownItems; // New optional dropdown items

  @override
  Widget build(BuildContext context) {
    if (dropdownItems != null && dropdownItems!.isNotEmpty) {
      // If dropdown items are provided, show a DropdownButtonFormField
      return DropdownButtonFormField<String>(
        value: dropdownItems![0], // Set initial value
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: GlobalValue.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
        icon: suffixIcon ? icon : null,
        items: dropdownItems!.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          textEditingController?.text = newValue ?? ''; // Update controller
        },
        validator: onValidator,
      );
    } else {
      // Regular TextFormField if no dropdown items provided
      return TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: onValidator,
        onFieldSubmitted: onFiledSubmittedValue,
        obscureText: obsecureText,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon ? icon : null,
          prefixIcon: prefixIcon ? icon : null,
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.black),
          label: Text(labelText),
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: GlobalValue.primaryColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      );
    }
  }
}
