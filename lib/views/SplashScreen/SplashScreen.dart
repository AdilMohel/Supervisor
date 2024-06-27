import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import 'Splash_services/Splash_Services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.changeScreen();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Image.asset(imgANBARlogo, width: 150, height: 130, fit: BoxFit.cover,)),
            SizedBox(height: 10,),
            Image.asset(imgANBARtl, width: 220, height: 60,),
          ],
        ),
      ),
    );
  }
}
