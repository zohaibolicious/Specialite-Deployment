import 'package:cloud_firestore/cloud_firestore.dart';

class DBS {
  DBS();

  // final CollectionReference usersRef = Firestore.instance.collection("Users");

  // Future updateUserData(String uid, String name, String email) async {
  //   return await usersRef.document(uid).setData({
  //     'id': uid,
  //     'name': name,
  //     'email': email,
  //     });
  // }

  // final CollectionReference restRef =
  //     Firestore.instance.collection("Restaurants");

  // // restaurants list from snapshot
  // List<rest> rests_list(QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return rest(name: doc.data['name'] ?? '', type: doc.data['type'] ?? '');
  //   }).toList();
  // }

  // //get restaurants stream
  // Stream<List<rest>> get rests {
  //   return restRef.snapshots()
  //   .map(rests_list);
  //}
}
