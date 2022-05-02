import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/mainPage.dart';
import 'package:trade_zilla/pages/sign_in.dart';
import 'package:trade_zilla/utilities/constants.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);
    if (user == null) {
      return AuthenticationClass();
    } else {
      return MainPage();
    }
  }
}
