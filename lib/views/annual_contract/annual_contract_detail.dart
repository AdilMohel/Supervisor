import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supervisior_anbar/widget_common/commen_header.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../../widget_common/our_button.dart';

class AnnualContractDetail extends StatelessWidget {
  const AnnualContractDetail({super.key});

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
                height: 240,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AnnualConDetail,
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 20,
                            fontFamily: bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(
                          numberofunits,
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 14,
                            fontFamily: regular,
                          ),
                          ),
                            Spacer(),
                            Text(
                            '10',
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
                              dates,
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
                              conpanyName,
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
                              visits,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                                fontFamily: regular,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '10',
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
                height: 320,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(customerINFO,
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 20,
                            fontFamily: bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                                fontFamily: bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              customerName,
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
                              contactNumber,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                                fontFamily: bold,
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
                              conpanyName,
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 14,
                                fontFamily: bold,
                              ),
                            ),
                          ]
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Image.asset(imgmap, fit: BoxFit.cover,),
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
                height: 180,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child: Column(
                  children: [
                  Align(
                  alignment: Alignment.centerLeft,
                    child: Text(notes,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 20,
                        fontFamily: bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(note,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontFamily: regular,
                    ),
                  ),
                  ]

                  ),
                ),

              ),
            ),
                SizedBox(height: 20),
                ourButton(
                  onPress: () {
                  },
                  color: primaryColor,
                  textColor: whiteColor,
                  title: takeContract,
                ),
              ],
            )
        ),
      ),
    );
  }
}
