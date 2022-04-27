import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/controllers/bottomNavController.dart';
import 'package:trade_zilla/pages/chatscreen.dart';
import 'package:trade_zilla/pages/favourite_screen.dart';
import 'package:trade_zilla/pages/homescreen.dart';
import 'package:trade_zilla/pages/user_profile.dart';
import 'package:trade_zilla/utilities/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: Text('TradeZila')),
          backgroundColor: organeColor,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
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
