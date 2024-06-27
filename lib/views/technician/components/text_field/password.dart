import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../consts/colors.dart';  // Ensure this path is correct for color constants

Widget profilePasswordField(Color borderColor, Color focusedBorderColor, bool isEditable) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: TextField(
      enabled: isEditable,
      obscureText: true,  // This ensures text is obscured
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
      cursorColor: isEditable ? blackColor : Colors.transparent,
    ),
  );
}
