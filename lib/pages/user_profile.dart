import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_zilla/authentication/authenticate.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/utilities/constants.dart';
import 'package:trade_zilla/widgets/bardivider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .1,
              left: MediaQuery.of(context).size.width - 390),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/profile_default.jpg'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                  onPressed: () {
                    print('Edit Profile pressed');
                    Get.toNamed('editprofile');
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
                'Iqbal Azhar',
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
              Text(
                'iqbal_azhar@yahoo.com',
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
    );
  }
}
