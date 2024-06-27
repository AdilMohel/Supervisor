import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../consts/colors.dart';
import '../consts/images.dart';
import '../views/drawer_screem/drawar.dart';

Widget buildHeader() {
  return Container(
    height: 100,
    width: double.infinity,
    color: primaryColor,
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imgANBARtl, width: 165, height: 45),
          IconButton(onPressed: () {
            Get.to(Drawar());
          }, icon: Image.asset(imgmenu)),
        ],
      ),
    ),
  );
}
