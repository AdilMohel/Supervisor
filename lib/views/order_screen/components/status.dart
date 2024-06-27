import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String statusText;
  final String statusImage;
  final String statusLabel;

  const StatusCard({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.statusText,
    required this.statusImage,
    required this.statusLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 175,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              statusLabel,
              style: TextStyle(color: textColor, fontSize: 12),
            ),
          ),
          Row(
            children: [
              Image.asset(statusImage, width: 50, height: 50),
              Text(
                statusText,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}