import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../../consts/styles.dart';

class Drawardata extends StatelessWidget {
  final String data;
  final void Function()? onArrowTap;

  const Drawardata({
    Key? key,
    required this.data,
    this.onArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border(
          bottom: BorderSide(
            color: lightgrey,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(
              data,
              style: TextStyle(
                color: blackColor,
                fontSize: 20,
                fontFamily: regular,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: onArrowTap,
              icon: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
