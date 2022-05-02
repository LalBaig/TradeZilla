class FirebaseUser {
  final String uid;
  FirebaseUser({required this.uid});
}

class UserData {
  final String? uid;
  final String name;
  final String email;
  final String phone;

  UserData(
      {required this.name, required this.email, required this.phone, this.uid});

  Map<String, dynamic> toMap() {
    return {
      "uid": this.uid,
      "name": this.name,
      "email": this.email,
      "phone": this.phone
    };
  }
}
