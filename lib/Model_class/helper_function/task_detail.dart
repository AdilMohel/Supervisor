// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:r_dotted_line_border/r_dotted_line_border.dart';
// import 'package:supervisior_anbar/Model_class/helper_function/task_firestore.dart';
// import '../../consts/colors.dart';
// import '../../consts/images.dart';
// import '../../consts/strings.dart';
// import '../../consts/styles.dart';
// import '../../views/home_screen/components/task_detail.dart';
// import '../task_model_class.dart';
//
// class TaskDetailWidget extends StatelessWidget {
//
//   const TaskDetailWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Task>>(
//       future: fetchAllTask(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator(
//             strokeWidth: double.infinity,
//           );
//         } else {
//           if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 Task task = snapshot.data![index];
//                 return  Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: GestureDetector(
//                   onTap: () {
//                     Get.to(() => TaskDetail(taskId: task.id));
//                     },
//                   child: Container(
//                     height: 240,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: whiteColor,
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: blackColor.withOpacity(0.3), // Shadow color with some transparency
//                           spreadRadius: 0,   // Extent of the shadow spread; can be set to 0
//                           blurRadius: 5,    // Blur radius; adjust for more or less blur effect
//                           offset: Offset(0, 4), // Position of shadow; adjust x,y to change the shadow direction
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 orderTask,
//                                 style: TextStyle(
//                                   color: greyColor,
//                                   fontSize: 14,
//                                   fontFamily: bold,
//                                 ),
//                               ),
//                               Text(
//                                 task.taskid,
//                                 style: TextStyle(
//                                   color: blackColor,
//                                   fontSize: 14,
//                                   fontFamily: bold,
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: 25,
//                                 width: 98,
//                                 decoration: BoxDecoration(
//                                   color: yellowColor,
//                                 ),
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     task.state,
//                                     style: TextStyle(
//                                       color: whiteColor,
//                                       fontSize: 12,
//                                       fontFamily: semibold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             border: RDottedLineBorder.all(
//                               width: 1,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 task.title,
//                                 style: TextStyle(
//                                   color: blackColor,
//                                   fontFamily: bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(
//                                 task.hour,
//                                 style: TextStyle(
//                                   color: redColor,
//                                   fontFamily: bold,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               Text(
//                                 hours,
//                                 style: TextStyle(
//                                   color: blackColor,
//                                   fontFamily: mediam,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             children: [
//                               Image.asset(imglocation),
//                               SizedBox(width: 2),
//                               Container(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(2.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         task.location,
//                                         style: TextStyle(
//                                           color: mate,
//                                           fontFamily: semibold,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                       Text(
//                                         task.distance,
//                                         style: TextStyle(
//                                           color: greyColor,
//                                           fontFamily: mediam,
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//               },
//             );
//           }
//         }
//         return CircularProgressIndicator(
//           strokeWidth: double.infinity,
//         );
//       },
//     );
//   }
// }
