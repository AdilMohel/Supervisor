import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supervisior_anbar/views/Landing_Screen/Landing_Screen.dart';
import 'package:supervisior_anbar/widget_common/navigation_menu.dart';

class SplashServices{

  void changeScreen() {
    final user = FirebaseAuth.instance.currentUser;

    if(user != null){
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(const NavigationMenu());
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(() => const LandingScreen());
      });
    }
  }
}