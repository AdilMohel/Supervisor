import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supervisior_anbar/widget_common/commen_header.dart';
import '../../../consts/colors.dart';
import '../../../consts/images.dart';
import '../../../consts/strings.dart';
import '../../../consts/styles.dart';


class TechnicianDetail extends StatelessWidget {
  const TechnicianDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.3), // Shadow color with some transparency
                          spreadRadius: 0,   // Extent of the shadow spread; can be set to 0
                          blurRadius: 5,    // Blur radius; adjust for more or less blur effect
                          offset: const Offset(0, 4), // Position of shadow; adjust x,y to change the shadow direction
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  techniciandetail,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 20,
                                    fontFamily: bold,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: lightblue,
                                    child: Icon(Icons.person, size: 15, color: whiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "vicky",
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  email,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  date,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  speciality,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  xyz,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  phoneNumber,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  number,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  gender,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  male,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 14,
                                    fontFamily: regular,
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: blackColor.withOpacity(0.3), // Shadow color with some transparency
                          spreadRadius: 0,   // Extent of the shadow spread; can be set to 0
                          blurRadius: 5,    // Blur radius; adjust for more or less blur effect
                          offset: const Offset(0, 4), // Position of shadow; adjust x,y to change the shadow direction
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  cnic,
                                  style: TextStyle(
                                    color: blackColor,
                                    fontSize: 16,
                                    fontFamily: bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Image.asset(imgmap, fit: BoxFit.cover,),
                              ),
                              Spacer(),
                              Container(
                                height: 70,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Image.asset(imgmap, fit: BoxFit.cover,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

              ],
            )
        ),
      ),
    );
  }
}