import 'package:cloud_firestore/cloud_firestore.dart';

class AnnualContract{
  final String id;
  final String title;
  final String state;
  final String date;
  final String Companyname;
  final String location;
  final String noOfUnit;
  final String noofVisit;
  final String CustomerName;
  final String CustomerPhone;
  final String CustomerNotes;

  AnnualContract({
    required this.title,
    required this.state,
    required this.date,
    required this.Companyname,
    required this.location,
    required this.noOfUnit,
    required this.noofVisit,
    required this.CustomerName,
    required this.CustomerPhone,
    required this.CustomerNotes,
    required this.id,
  });

  factory AnnualContract.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return AnnualContract(
      id: doc.id,
      title: json['title'] as String,
      state: json['state'] as String,
      date: json['date'] as String,
      Companyname: json['Companyname'] as String,
      location: json['location'] as String,
      noOfUnit: json['noOfUnit'] as String,
      noofVisit: json['noofVisit'] as String,
      CustomerName: json['CustomerName'] as String,
      CustomerPhone: json['CustomerPhone'] as String,
      CustomerNotes: json['CustomerNotes'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'state': state,
      'date': date,
      'Companyname': Companyname,
      'location': location,
      'noOfUnit': noOfUnit,
      'noofVisit': noofVisit,
      'CustomerName': CustomerName,
      'CustomerPhone': CustomerPhone,
      'CustomerNotes': CustomerNotes,
    };
  }

}