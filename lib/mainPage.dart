import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/authentication/authenticate.dart';
import 'package:trade_zilla/controllers/bottomNavController.dart';
import 'package:trade_zilla/database/database.dart';
import 'package:trade_zilla/pages/chatscreen.dart';
import 'package:trade_zilla/pages/favourite_screen.dart';
import 'package:trade_zilla/pages/homescreen.dart';
import 'package:trade_zilla/pages/setting.dart';
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
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
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
                              ? Text('Settings')
                              : Text('')),
          backgroundColor: organeColor,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(
                onPressed: () {
                  print('user profile pressed');
                  Get.toNamed('/userprofile');
                },
                icon: const Icon(Icons.account_circle))
          ],
        ),
        body: IndexedStack(
          index: controller.tabindex,
          children: [
            HomeScreen(),
            ChatScreen(),
            FavouriteScreen(),
            Settings(),
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
