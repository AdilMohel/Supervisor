import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supervisior_anbar/views/order_screen/Order_Screen.dart';
import '../consts/colors.dart';
import '../views/annual_contract/annual_contract.dart';
import '../views/home_Screen/home_Screen.dart';
import '../views/profile/profile_Screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            backgroundColor: primaryColor,
            // Background color for the navigation bar
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return TextStyle(
                  color: whiteColor, // Color for selected label
                  fontWeight: FontWeight.bold, // Bold font for selected label
                );
              }
              return TextStyle(
                color: lightgrey, // Color for unselected label
                fontWeight: FontWeight.normal, // Normal font for unselected label
              );
            }),
            iconTheme: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return IconThemeData(color: whiteColor); // Color for selected icon
              }
              return IconThemeData(color: lightgrey); // Color for unselected icon
            }),
          ),
          child: NavigationBar(
            height: 73,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home), label: 'Home',),
              NavigationDestination(
                  icon: Icon(Icons.list_alt_outlined), label: 'Orders'),
              NavigationDestination(
                  icon: Icon(Icons.chat_outlined), label: 'Chat'),
              NavigationDestination(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: Obx(
            () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(), OrderScreen(), AnnualContract(), ProfileScreen()];
}
