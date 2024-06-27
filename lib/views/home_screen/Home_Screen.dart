// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supervisior_anbar/consts/consts.dart';
// import 'package:supervisior_anbar/views/annual_contract/annual_contract.dart';
// import '../../Model_class/helper_function/task_detail.dart';
// import '../../widget_common/commen_header.dart';
// import 'components/active_task.dart';
// import 'components/status.dart';
//
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             buildHeader(),
//             const SizedBox(height: 10,),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Get.to(const AnnualContract());
//                           },
//                           child: const StatusCard(
//                             backgroundColor: limecolor,
//                             textColor: whiteColor,
//                             statusText: active,
//                             statusImage: imgstatus,
//                             // Change this to your actual asset path
//                             statusLabel: myStatus,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         StatusCard(
//                           backgroundColor: lightpurple,
//                           textColor: whiteColor,
//                           statusText: numberofTO,
//                           statusImage: imgdone,
//                           // Change this to your actual asset path
//                           statusLabel: completedorder,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 100,
//                       width: 175,
//                       decoration: BoxDecoration(
//                         color: lightblue,
//                         borderRadius: BorderRadius.circular(1),
//                       ),
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.all(12),
//                             child: Text(
//                               annualmaintainence,
//                               style: TextStyle(
//                                   color: whiteColor, fontSize: 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//              SizedBox(height: 10,),
//              Active_Task(),
//              SizedBox(height: 10,),
//              Expanded(child: TaskDetailWidget()),
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supervisior_anbar/consts/consts.dart';
import 'package:supervisior_anbar/views/annual_contract/annual_contract.dart';
import '../../Model_class/task_model_class.dart';
import '../../widget_common/commen_header.dart';
import 'components/active_task.dart';
import 'components/status.dart';
import 'components/task_detail.dart';

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
            const SizedBox(height: 10),
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
                              style: TextStyle(color: whiteColor, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Active_Task(),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<Task>>(
                stream: streamAllTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Task task = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => TaskDetail(taskId: task.id));
                              },
                              child: Container(
                                height: 240,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: blackColor.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: const Offset(0, 4),
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
                                            orderTask,
                                            style: TextStyle(
                                              color: greyColor,
                                              fontSize: 14,
                                              fontFamily: bold,
                                            ),
                                          ),
                                          Text(
                                            task.taskid,
                                            style: TextStyle(
                                              color: blackColor,
                                              fontSize: 14,
                                              fontFamily: bold,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 98,
                                            decoration: BoxDecoration(
                                              color: yellowColor,
                                            ),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                task.state,
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            task.title,
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            task.hour,
                                            style: TextStyle(
                                              color: redColor,
                                              fontFamily: bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            hours,
                                            style: TextStyle(
                                              color: blackColor,
                                              fontFamily: mediam,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: [
                                          Image.asset(imglocation),
                                          const SizedBox(width: 2),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  task.location,
                                                  style: TextStyle(
                                                    color: mate,
                                                    fontFamily: semibold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  task.distance,
                                                  style: TextStyle(
                                                    color: greyColor,
                                                    fontFamily: mediam,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Replace fetchAllTask() with a function that returns a Stream<List<Task>>
Stream<List<Task>> streamAllTasks() {
  return FirebaseFirestore.instance
      .collection('Task')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => Task.fromFirestore(doc))
      .toList());
}
