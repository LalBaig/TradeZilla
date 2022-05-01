import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_zilla/utilities/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Text("Profile"),
        ),
        backgroundColor: organeColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .1,
                      horizontal: MediaQuery.of(context).size.width - 250),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/profile_default.jpg'),
                  ),
                ),
                Positioned(
                  left: 170,
                  bottom: 60,
                  child: CircleAvatar(
                    backgroundColor: organeColor,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: whtColor,
                        )),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Name:",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[250],
                            filled: true,
                            hintText: 'Iqbal Azher',
                            hintStyle: TextStyle(color: lightGray),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 0)),
                        style: TextStyle(fontSize: 18, color: primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[250],
                            filled: true,
                            hintText: "iqbal_azhar@yahoo.com",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: lightGray),
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 0)),
                        style: TextStyle(fontSize: 18, color: primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[250],
                            filled: true,
                            hintText: "iqbal_azhar@yahoo.com",
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: lightGray),
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 0)),
                        style: TextStyle(fontSize: 18, color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Save');
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[400],
                        ),
                        child: Text(
                          'SAVE',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: whtColor,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
