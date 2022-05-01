import 'package:cloud_firestore/cloud_firestore.dart';

class database {
  final String uid;
  final CollectionReference profileInfo =
      FirebaseFirestore.instance.collection("Users");

  database({required this.uid});

  Future<void> createUserProfile(
    String name,
    String email,
    String phone,
  ) async {
    return await profileInfo.doc(uid).set({
      'name': name,
      'phone': phone,
      'email': email,
    });
  }
}
