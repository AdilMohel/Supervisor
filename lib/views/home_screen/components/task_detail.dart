import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supervisior_anbar/Model_class/task_model_class.dart';
import 'package:supervisior_anbar/widget_common/commen_header.dart';
import '../../../Model_class/helper_function/task_firestore.dart';
import '../../../consts/colors.dart';
import '../../../consts/images.dart';
import '../../../consts/strings.dart';
import '../../../consts/styles.dart';



class TaskDetail extends StatelessWidget {
  final String taskId;
  const TaskDetail({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Task?>(
      future: fetchTaskDetails(taskId),
      builder: (context, snapshot)  {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(
            strokeWidth: double.infinity,
          );
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            Task? task = snapshot.data;
            if(task != null) {
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
                              height: 200,
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
                                        task.title,
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
                                            task.noOfUnit.toString(),
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
                                            task.date.toDate().toString(),
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
                                            technicianName,
                                            style: TextStyle(
                                              color: blackColor,
                                              fontSize: 14,
                                              fontFamily: bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            task.techName,
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
                                            task.customerName,
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
                                            task.customerPhone,
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
                                            map,
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
                              height: 150,
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
                                      Text(
                                        task.customerNotes,
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
                        ],
                      )
                  ),
                ),
              );
          }else {
              return const Center(child: Text('Order Not found'));
            }
          }
        }
        return const Text('No Data');
      },

    );

  }
}
