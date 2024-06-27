import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supervisior_anbar/consts/consts.dart';
import 'package:supervisior_anbar/views/home_screen/Home_Screen.dart';
import 'package:supervisior_anbar/widget_common/navigation_menu.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../widget_common/our_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    _auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text.toString()).then((value) {
        Get.to(NavigationMenu());
      }).onError((error, stackTrace){
        Get.snackbar(
          error.toString(),
          stackTrace.toString(),
          backgroundColor: primaryColor,
          colorText: whiteColor,
        );

      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  child: Image.asset(imgAnbarTitleCl,),
                ),
              ),
              SizedBox(height: 80),
              Form(
                key: _formkey,
                child: Column(
                  children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: email,
                    labelStyle: TextStyle(color: primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  cursorColor: blackColor,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,


                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: password,
                    labelStyle: TextStyle(color: primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  cursorColor: blackColor,
                  validator: (value){
                    if(value!.isEmpty){
                      return pleaseEnterYourPassword;
                    }
                    return null;
                  },
                ),
              ),
                  ],
                ),
              ),

              SizedBox(height: 50),
              ourButton(
                onPress: () {
                  if(_formkey.currentState!.validate()){
                    login();
                  }
                },
                color: primaryColor,
                textColor: whiteColor,
                title: Login,
              ),

            ],
          ),
        )
      ),

    );
  }
}
