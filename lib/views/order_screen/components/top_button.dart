import 'package:flutter/material.dart';

class OrderButtons extends StatelessWidget {
  final String currentBooking;
  final Color primaryColor;
  final Color whiteColor;
  final String fontFamily;
  final void Function()? onTap;

  const OrderButtons({
    Key? key,
    required this.currentBooking,
    required this.primaryColor,
    required this.whiteColor,
    required this.fontFamily,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap here
        print('Container pressed!');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          height: 40,
          width: 160,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              currentBooking,
              style: TextStyle(
                color: whiteColor,
                fontSize: 12,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
