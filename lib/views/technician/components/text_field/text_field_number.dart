import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../consts/colors.dart';


Widget phoneTextFieldEntry(Color borderColor, Color focusedBorderColor,
    MaskTextInputFormatter formatter, bool isEditable) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: TextField(
      enabled: isEditable,
      inputFormatters: [formatter],
      keyboardType: TextInputType.phone,
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
        cursorColor: isEditable ? blackColor : Colors.transparent
    ),
  );
}
