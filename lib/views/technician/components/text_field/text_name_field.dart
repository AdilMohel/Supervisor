import 'package:flutter/cupertino.dart';

Widget profileTextField(String label, String fontFamily, double fontSize) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        label,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ),
    ),
  );
}
