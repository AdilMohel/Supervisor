import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:supervisior_anbar/widget_common/commen_header.dart';
import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import '../../modelclass_AC/helper_function/annual_ui.dart';
import 'annual_contract_detail.dart';

class AnnualContract extends StatelessWidget {
  const AnnualContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 260,
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                        date ,
                            style: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                              fontFamily: bold,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 25,
                            width: 98,
                            decoration: const BoxDecoration(
                              color: lightblue,
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                open,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 12,
                                  fontFamily: semibold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: RDottedLineBorder.all(
                          width: 1,
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AnnualConDetail,
                            style: TextStyle(
                              color: blackColor,
                              fontFamily: bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text(
                            hours,
                            style: TextStyle(
                              color: redColor,
                              fontFamily: bold,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          conpanyName,
                          style: TextStyle(
                            color: blackColor,
                            fontFamily: semibold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          xyz,
                          style: TextStyle(
                            color: blackColor,
                            fontFamily: semibold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                      TextButton(
                          onPressed: () {
                            Get.to(AnnualContractDetail());
                          },
                          child: Text(
                            viewDetails,
                            style: TextStyle(
                                color: lightblue,
                                fontSize: 12,
                                fontFamily: semibold,
                            ),
                          )
                      ),
                      Spacer(),

                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(imgDistanceloc),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            locationDistance,
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 12,
                              fontFamily: mediam,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(child: AnnualContractWidget()),
          ],
        ),
      ),
    );
  }
}
