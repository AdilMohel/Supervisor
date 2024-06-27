import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../../widget_common/our_button.dart';
import '../Auth_Screen/Login_Screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const Center(
                 child: Padding(
                   padding: EdgeInsets.only(top: 100),
                   child: Text(
                    bestHelpingLb,
                    style: TextStyle(fontSize: 32, fontFamily: bold,),
                   ),
                 ),
               ),
              const Spacer(),
              Center(child: Image.asset(imgLandingSC, width: 375, height: 326,)),
              SizedBox(height: 100,),
              ourButton(
                onPress: () {
                  Get.to(()=> const LoginScreen());
                },
                color: primaryColor,
                textColor: whiteColor,
                title: getStartedLb,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),

    );
  }
}
