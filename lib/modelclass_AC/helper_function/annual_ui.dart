import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:supervisior_anbar/consts/consts.dart';
import 'package:supervisior_anbar/modelclass_AC/helper_function/annual_deatil_ui.dart';
import 'package:supervisior_anbar/modelclass_AC/helper_function/model_service.dart';
import 'package:supervisior_anbar/modelclass_AC/modelclass1.dart';
import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';

class AnnualContractWidget extends StatelessWidget {

  const AnnualContractWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnnualContract>>(
      future: fetchAllAnnualContract(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            strokeWidth: double.infinity,
          );
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                AnnualContract annualContract = snapshot.data![index];
                return Padding(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                               Text(
                                annualContract.date,
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
                                child:  Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    annualContract.state,
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
                         Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                annualContract.title,
                                style: TextStyle(
                                  color: blackColor,
                                  fontFamily: bold,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
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
                              annualContract.Companyname,
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
                                  Get.to(() => AnnualWidgetDetail(AnnualContractId: annualContract.id));

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
                                annualContract.location,
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
                );
              },
            );
          }
        }
        return CircularProgressIndicator(
          strokeWidth: double.infinity,
        );
      },
    );
  }
}
