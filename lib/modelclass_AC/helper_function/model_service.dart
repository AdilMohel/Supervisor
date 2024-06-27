import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supervisior_anbar/modelclass_AC/modelclass1.dart';

Future<List<AnnualContract>> fetchAllAnnualContract() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('AnnualContract').get();
  return querySnapshot.docs.map((doc) => AnnualContract.fromFirestore(doc)).toList();
}
Future<AnnualContract?> fetchAnnualContractDetails(String AnnualContractId) async {
  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('AnnualContract').doc(AnnualContractId).get();
  if (doc.exists) {
    return AnnualContract.fromFirestore(doc);
  } else {
    return null;
  }

}