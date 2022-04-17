import 'package:trade_zilla/controllers/bottomNavController.dart';
import 'package:trade_zilla/pages/create_new_pass.dart';
import 'package:trade_zilla/pages/forgotpassword.dart';
import 'package:trade_zilla/pages/hompage.dart';
import 'package:trade_zilla/pages/otp_screen.dart';
import 'package:trade_zilla/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _mainscreen_controller = Get.put(MainScreenController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: '/loginscreen',
            page: () => AuthenticationClass(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/otpscreen',
            page: () => Otp_Screen(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/mainpage',
            page: () => HomeScreen(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/forgotpassword',
            page: () => ForgotPassword(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/createnewpassword',
            page: () => CreateNewPassword(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
      ],
      initialRoute: '/createnewpassword',
    );
  }
}
