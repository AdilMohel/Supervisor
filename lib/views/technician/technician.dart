// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:supervisior_anbar/views/technician/components/tech_buttons.dart';
//
// import '../../consts/colors.dart';
// import '../../consts/strings.dart';
// import '../../consts/styles.dart';
// import '../../widget_common/commen_header.dart';
// import 'components/add_tech.dart';
// import 'components/tech_detail.dart';
//
// class TechnicainData extends StatefulWidget {
//   const TechnicainData({super.key});
//
//   @override
//   State<TechnicainData> createState() => _TechnicainDataState();
// }
//
// class _TechnicainDataState extends State<TechnicainData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildHeader(),
//               SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TechnicianButton(label: allTech, primaryColor: lightblue, textColor: whiteColor, onPressed: (){}),
//                     TechnicianButton(label: addtech, primaryColor: primaryColor, textColor: whiteColor, onPressed: (){
//                       Get.to(AddTechnician());
//                     }),
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20,),
//                 child: GestureDetector(
//                   onTap: (){
//                     Get.to(TechnicianDetail());
//                   },
//                   child: Container(
//                     height: 120,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: whiteColor,
//                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: blackColor.withOpacity(0.3), // Shadow color with some transparency
//                           spreadRadius: 0,   // Extent of the shadow spread; can be set to 0
//                           blurRadius: 5,    // Blur radius; adjust for more or less blur effect
//                           offset: const Offset(0, 4), // Position of shadow; adjust x,y to change the shadow direction
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                           child: Align(
//                             alignment: Alignment.topLeft,
//                             child: CircleAvatar(
//                               radius: 20,
//                               backgroundColor: lightblue,
//                               child: Icon(Icons.person, size: 33, color: whiteColor),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Technician Name',
//                                 style: TextStyle(
//                                   color: blackColor,
//                                   fontSize: 18,
//                                   fontFamily: regular,
//                                 ),
//                               ),
//                               Text(
//                                 'HVAC Technician',
//                                 style: TextStyle(
//                                   color: blackColor,
//                                   fontSize: 14,
//                                   fontFamily: regular,
//                                 ),
//                               ),
//                               Text(
//                                 'ID# 123456',
//                                 style: TextStyle(
//                                   color: blackColor,
//                                   fontSize: 14,
//                                   fontFamily: regular,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20,),
//                           child: Container(
//                             height: 30,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 'Active',
//                                 style: TextStyle(
//                                   color: whiteColor,
//                                   fontSize: 14,
//                                   fontFamily: regular,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     ),
//                 ),
//               ),
//
//             ],
//
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../consts/colors.dart';
import '../../consts/strings.dart';
import '../../consts/styles.dart';
import 'components/add_tech.dart';
import 'components/tech_detail.dart';
import 'package:get/get.dart';


class TechnicainData extends StatefulWidget {
  const TechnicainData({super.key});

  @override
  State<TechnicainData> createState() => _TechnicainDataState();
}

class _TechnicainDataState extends State<TechnicainData> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          // title: buildHeader(),
          bottom: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: whiteColor,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: whiteColor,
            ),
            tabs: [
              Tab(text: allTech),
              Tab(text: addtech),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              AllTechniciansView(),
              AddTechnician(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllTechniciansView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('technicians').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: snapshot.data!.docs.map((doc) {
                  var technician = doc.data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Get.to(TechnicianDetail(

                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: 120,
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
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: lightblue,
                                  backgroundImage: technician['profile_image'].isNotEmpty
                                      ? NetworkImage(technician['profile_image'])
                                      : null,
                                  child: technician['profile_image'].isEmpty
                                      ? Icon(Icons.person, size: 33, color: whiteColor)
                                      : null,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${technician['first_name']} ${technician['last_name']}',
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 18,
                                      fontFamily: regular,
                                    ),
                                  ),
                                  Text(
                                    technician['speciality'],
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14,
                                      fontFamily: regular,
                                    ),
                                  ),
                                  Text(
                                    'ID# ${technician['email']}', // Assuming document ID is the technician ID
                                    style: TextStyle(
                                      color: blackColor,
                                      fontSize: 14,
                                      fontFamily: regular,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  bool newStatus = !(technician['status'] ?? true);
                                  FirebaseFirestore.instance
                                      .collection('technicians')
                                      .doc(doc.id)
                                      .update({'status': newStatus});
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: technician['status'] ?? true ? primaryColor : redColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      technician['status'] ?? true ? 'Active' : 'Banned',
                                      style: TextStyle(
                                        color: whiteColor,
                                        fontSize: 14,
                                        fontFamily: regular,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

