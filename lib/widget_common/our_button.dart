import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../consts/styles.dart';

Widget ourButton({Function()? onPress, Color? color, Color? textColor, String? title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress, // Correct way to assign the function
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? '', // Safeguard for null title
            style: TextStyle(color: textColor, fontFamily: semibold, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}