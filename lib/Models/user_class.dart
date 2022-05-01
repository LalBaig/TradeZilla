class UserData {
  final String uid;
  final String name;
  final String email;
  final String phone;

  UserData(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uid});
}

class FirebaseUser {
  final String uid;
  FirebaseUser({required this.uid});
}
