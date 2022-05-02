import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/authentication/authenticate.dart';
import 'package:trade_zilla/database/database.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/widgets/bottomsheet_filtre.dart';
import 'package:trade_zilla/widgets/product_gridview.dart';
import 'package:trade_zilla/widgets/search_widget.dart';
import 'package:trade_zilla/data/dummydata.dart';

import '../utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Authenticate auth = Authenticate();

  String query = '';
  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        isScrollControlled: true,
        context: ctx,
        builder: (ctx) => BottomSheetFiltre());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Row(children: [
            Flexible(flex: 5, child: buildSearch),
            Flexible(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  icon: Icon(Icons.filter_list_rounded)),
            ),
          ]),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 30),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              height: 60,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('pressed');
                        Get.toNamed('/categoryscreen');
                      },
                      child: Container(
                          child: Column(children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 20,
                          ),
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
                      ])),
                    );
                  })),
        ]),
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 30),
          child: Text(
            "Recommended",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: GridView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsetsDirectional.all(30),
                  children: gridData
                      .map((data) => ProductGridView(
                          data.id,
                          data.image,
                          data.productName,
                          data.exchangewith,
                          data.address,
                          data.description))
                      .toList(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    childAspectRatio: (2 / 3),
                  )),
            ),
          ),
        ),
      ],
    );
  }

  Widget get buildSearch => SearchWidget(
        text: query,
        hintText: 'Search Product',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    setState(() {
      this.query = query;
    });
  }
}
