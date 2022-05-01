import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/authentication/authenticate.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/wrapper.dart';

class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      catchError: (_, __) => null,
      value: Authenticate().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: organeColor,
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: organeColor),
          )),
          hintColor: organeColor,
          textSelectionTheme: TextSelectionThemeData(cursorColor: organeColor),
        ),
        home: Wrapper(),
      ),
    );
  }
}
