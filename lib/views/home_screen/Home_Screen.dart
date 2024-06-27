import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supervisior_anbar/consts/consts.dart';
import 'package:supervisior_anbar/views/annual_contract/annual_contract.dart';
import '../../Model_class/helper_function/task_detail.dart';
import '../../widget_common/commen_header.dart';
import 'components/active_task.dart';
import 'components/status.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(const AnnualContract());
                          },
                          child: const StatusCard(
                            backgroundColor: limecolor,
                            textColor: whiteColor,
                            statusText: active,
                            statusImage: imgstatus,
                            // Change this to your actual asset path
                            statusLabel: myStatus,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        StatusCard(
                          backgroundColor: lightpurple,
                          textColor: whiteColor,
                          statusText: numberofTO,
                          statusImage: imgdone,
                          // Change this to your actual asset path
                          statusLabel: completedorder,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 175,
                      decoration: BoxDecoration(
                        color: lightblue,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              annualmaintainence,
                              style: TextStyle(
                                  color: whiteColor, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 10,),
             Active_Task(),
             SizedBox(height: 10,),
             Expanded(child: TaskDetailWidget()),





          ],
        ),
      ),
    );
  }
}

