import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supervisior_anbar/views/technician/technician.dart';
import 'package:supervisior_anbar/widget_common/commen_header.dart';
import '../../consts/colors.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../Auth_Screen/Login_Screen.dart';
import '../technician/components/add_tech.dart';
import 'components/fields.dart';

class Drawar extends StatefulWidget {
  const Drawar({super.key});

  @override
  State<Drawar> createState() => _DrawarState();
}

class _DrawarState extends State<Drawar> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 10),
            Container(
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
                          technician,
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 20,
                              fontFamily: regular),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.to(TechnicainData());
                          },
                          icon: Icon(Icons.arrow_forward_ios),
                        )
                      ],
                    ),
              )
            ),
            Drawardata(
              data: contactus,
              onArrowTap: () {
                Get.to(AddTechnician());
                // Navigate to home screen
              },
            ),
            Drawardata(
              data: share,
              onArrowTap: () {
                // Navigate to home screen
              },
            ),
            Drawardata(
              data: rate,
              onArrowTap: () {
                // Navigate to home screen
              },
            ),
            Drawardata(
              data: logout,
              onArrowTap: () {
                  auth.signOut().then((value) {
                    Get.offAll(const LoginScreen());
                  });
                },
              ),

          ],
        ),
      )
    );
  }
}
