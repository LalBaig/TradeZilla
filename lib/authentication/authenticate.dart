import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/database/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser? _userfromFirebase(User user) {
    return user != null ? FirebaseUser(uid: user.uid) : null;
  }

  Stream<FirebaseUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromFirebase(user!));
  }

  String? getUser() {
    return user != null ? _auth.currentUser!.uid : null;
  }

  Future Sign_In(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = FirebaseAuth.instance.currentUser;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future ResetPassword(String email) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      e.toString();
      return null;
    }
  }

  Future Sign_Out() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future ResisterUser(
    String email,
    String pass,
    String name,
    String phone,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User? user = FirebaseAuth.instance.currentUser;
      return _userfromFirebase;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
