import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/authentication/authenticate.dart';
import 'package:trade_zilla/controllers/bottomNavController.dart';
import 'package:trade_zilla/pages/chatscreen.dart';
import 'package:trade_zilla/pages/favourite_screen.dart';
import 'package:trade_zilla/pages/homescreen.dart';
import 'package:trade_zilla/pages/user_profile.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/utilities/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final iconList = <IconData>[
    Icons.home,
    Icons.chat,
    Icons.favorite,
    Icons.person
  ];
  final Authenticate auth = Authenticate();

  @override
  Widget build(BuildContext context) {
    final Authenticate _auth = Authenticate();

    void initState() {
      // TODO: implement initState
      super.initState();
    }

    return GetBuilder<BottomNavigationController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
              child: controller.tabindex == 0
                  ? Text('TradeZila')
                  : controller.tabindex == 1
                      ? Text('Chats')
                      : controller.tabindex == 2
                          ? Text('Favourites')
                          : controller.tabindex == 3
                              ? Text('Profile')
                              : Text('')),
          backgroundColor: organeColor,
          actions: [
            controller.tabindex == 0
                ? IconButton(
                    onPressed: () {}, icon: const Icon(Icons.notifications))
                : controller.tabindex == 3
                    ? IconButton(
                        onPressed: () {
                          print('logout');
                          _auth.Sign_Out();
                          Get.offAllNamed('/beginscreen');
                        },
                        icon: const Icon(Icons.logout))
                    : Text('')
          ],
        ),
        body: IndexedStack(
          index: controller.tabindex,
          children: [
            HomeScreen(),
            ChatScreen(),
            FavouriteScreen(),
            UserProfile()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: organeColor,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          activeIndex: controller.tabindex,
          activeColor: organeColor,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => controller.changetabindex(index),
          //other params
        ),
      );
    });
  }
}
