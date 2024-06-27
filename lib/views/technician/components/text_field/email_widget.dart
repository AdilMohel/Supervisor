import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final Color borderColor;
  final Color focusedBorderColor;
  final bool isEditable; // New parameter to control editability

  const EmailInputField({
    Key? key,
    required this.controller,
    this.borderColor = greyColor,
    this.focusedBorderColor = blackColor,
    this.isEditable = true, // Default is true, field is editable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        enabled: isEditable, // Use the isEditable parameter to enable or disable the field
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: focusedBorderColor),
          ),
          errorStyle: TextStyle(color: Colors.redAccent),
          // Style for error text
        ),
        cursorColor: isEditable ? blackColor : Colors.transparent, // Conditional cursor color
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Enter a valid email address';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction, // Validate each time the user interacts with the field
      ),
    );
  }
}
