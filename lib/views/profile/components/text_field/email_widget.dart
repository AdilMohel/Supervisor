import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditable;

  const EmailInputField({
    Key? key,
    required this.controller,
    this.isEditable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        enabled: isEditable,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: blackColor),
          ),
          errorStyle: TextStyle(color: Colors.redAccent),
        ),
        cursorColor: isEditable ? blackColor : Colors.transparent,
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
