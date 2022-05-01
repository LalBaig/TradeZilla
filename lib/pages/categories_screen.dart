import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/utilities/colors.dart';

import '../utilities/constants.dart';

class Category_Screen extends StatefulWidget {
  const Category_Screen({Key? key}) : super(key: key);

  @override
  State<Category_Screen> createState() => _Category_ScreenState();
}

class _Category_ScreenState extends State<Category_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Text('Categories')),
          backgroundColor: organeColor),
      body: Container(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('pressed');
                    Get.back();
                  },
                  child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24, left: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(left: 10, right: 20),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2.0,
                                          color: Colors.grey.withOpacity(.5),
                                          offset: Offset(5, 3))
                                    ],
                                    color: data[index]['color'],
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  data[index]['icon'],
                                  color: whtColor,
                                ),
                                height: 50,
                                width: 50,
                              ),
                              data.isEmpty
                                  ? Text('Null')
                                  : Text(
                                      data[index]['categoryTitle'].toString())
                            ],
                          ),
                        ),
                      ])),
                );
              })),
    );
  }
}
