import 'package:cloud_firestore/cloud_firestore.dart';

import '../task_model_class.dart';

Future<List<Task>> fetchAllTask() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Task').get();
  return querySnapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
}

Future<Task?> fetchTaskDetails(String taskId) async {
  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Task').doc(taskId).get();
  if (doc.exists) {
    return Task.fromFirestore(doc);
  } else {
    return null;
  }

}