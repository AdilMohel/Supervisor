import 'package:flutter/material.dart';
import 'package:supervisior_anbar/consts/consts.dart';

class TechnicianButton extends StatelessWidget {
  final String label;
  final Color primaryColor;
  final Color textColor;
  final VoidCallback onPressed;

  TechnicianButton({
    required this.label,
    required this.primaryColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontFamily: bold, // Replace with your font family
            ),
          ),
        ),
      ),
    );
  }
}
