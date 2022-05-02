import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/database/database.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/utilities/constants.dart';
import 'package:trade_zilla/widgets/bardivider.dart';
import 'package:trade_zilla/widgets/spinder.dart';
import 'dart:io' as io;
import '../authentication/authenticate.dart';

class UserProfile extends StatefulWidget {
  UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  io.File? _Image;

  String? userid;
  String name = '';
  String email = '';
  String phone = '';
  late final DatabaseHelper db;
  final Authenticate auth = Authenticate();
  List<UserData> userdata = [];

  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserProfileImage();
    db = DatabaseHelper();
    isloading = true;
    getData();
  }

  void getData() async {
    userid = auth.getUser();
    userdata = await db.retrieveUserData(userid);

    setState(() {
      name = userdata[0].name;
      email = userdata[0].email;
      phone = userdata[0].phone;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isloading = false;
      });
    });
  }

  final Authenticate _auth = Authenticate();

  @override
  Widget build(BuildContext context) {
    return isloading
        ? loading_spin()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: organeColor,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text('Profile'),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      print('logout');
                      _auth.Sign_Out();
                      Get.offAllNamed('/beginscreen');
                    },
                    icon: const Icon(Icons.logout))
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .1,
                      left: MediaQuery.of(context).size.width - 390),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _Image == null
                            ? AssetImage('assets/images/profile_default.jpg')
                            : Image.file(io.File(_Image!.path)).image,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextButton(
                          onPressed: () {
                            print('Edit Profile pressed');

                            Get.toNamed('/editprofile', arguments: [
                              {'name': name},
                              {'email': email},
                              {'phone': phone},
                            ]);
                          },
                          child: Text(
                            "Edit Profile",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: organeColor,
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const BrandDivider(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 28,
                        color: black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        name,
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: grey,
                        ),
                      )
                    ],
                  ),
                ),
                const BrandDivider(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 28,
                        color: black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          email,
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const BrandDivider(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 28,
                        color: black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        phone,
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: grey,
                        ),
                      )
                    ],
                  ),
                ),
                const BrandDivider(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.help,
                        size: 28,
                        color: black,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Help and Support',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: grey,
                        ),
                      )
                    ],
                  ),
                ),
                const BrandDivider(),
              ],
            ),
          );
  }

  void GetUserProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? temp = prefs.getString("ProfileImage");
    if (temp == null) {
      return;
    }

    setState(() {
      _Image = io.File(temp);
    });
  }
}
