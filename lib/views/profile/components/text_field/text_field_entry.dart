import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../consts/colors.dart';

Widget profileTextFieldEntry(Color borderColor, Color focusedBorderColor, bool isEditable, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: TextFormField(
      controller: controller,
      enabled: isEditable,
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
