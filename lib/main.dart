import 'package:firebase_core/firebase_core.dart';
import 'package:trade_zilla/StartScreen.dart';
import 'package:trade_zilla/controllers/bottomNavController.dart';
import 'package:trade_zilla/pages/categories_screen.dart';
import 'package:trade_zilla/pages/create_new_pass.dart';
import 'package:trade_zilla/pages/edit_profile.dart';
import 'package:trade_zilla/pages/forgotpassword.dart';
import 'package:trade_zilla/mainPage.dart';
import 'package:trade_zilla/pages/otp_screen.dart';
import 'package:trade_zilla/pages/product_detail.dart';
import 'package:trade_zilla/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/pages/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavigationController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TradeZilla',
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
            name: '/beginscreen',
            page: () => StartUpScreen(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/otpscreen',
            page: () => Otp_Screen(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/mainpage',
            page: () => MainPage(),
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
        GetPage(
            name: '/categoryscreen',
            page: () => Category_Screen(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/productdetail',
            page: () => ProductDetail(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/editprofile',
            page: () => EditProfile(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
        GetPage(
            name: '/userprofile',
            page: () => UserProfile(),
            transitionDuration: Duration(milliseconds: 900),
            transition: Transition.cupertino),
      ],
      initialRoute: '/beginscreen',
    );
  }
}
