import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  final String id;
  final String title;
  final String taskid;
  final String state;
  final String hour;
  final String location;
  final String distance;
  final int noOfUnit;
  final Timestamp date;
  final String techName;
  final String customerName;
  final String customerPhone;
  final String customerNotes;

  Task({
    required this.title,
    required this.taskid,
    required this.state,
    required this.hour,
    required this.location,
    required this.distance,
    required this.noOfUnit,
    required this.date,
    required this.techName,
    required this.customerName,
    required this.customerPhone,
    required this.customerNotes,
    required this.id,

  });

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      taskid: json['taskid'] as String,
      title: json['title'] as String,
      state: json['state'] as String,
      hour: json['hour'] as String,
      location: json['location'] as String,
      distance: json['distance'] as String,
      noOfUnit: json['noOfUnit'] as int,
      date: json['date'] as Timestamp,
      techName: json['techName'] as String,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      customerNotes: json['customerNotes'] as String,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskid': taskid,
      'title': title,
      'state': state,
      'hour': hour,
      'location': location,
      'distance': distance,
      'noOfUnit': noOfUnit,
      'date': date,
      'techName': techName,
      'customerName': customerName,
      'customerPhone': customerPhone,
      'customerNotes': customerNotes,

    };
  }


}


