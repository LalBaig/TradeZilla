import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/database/database.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'dart:io' as io;
import '../authentication/authenticate.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  io.File? _storedImage;

  dynamic argumentData = Get.arguments;
  late final DatabaseHelper db;
  String userid = '';

  late String name, email, phone;
  final Authenticate auth = Authenticate();

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    GetUserProfileImage();
    name = argumentData[0]['name'];
    email = argumentData[1]['email'];
    phone = argumentData[2]['phone'];
    db = DatabaseHelper();
    userid = auth.getUser()!;
  }

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
                    backgroundImage: _storedImage == null
                        ? AssetImage('assets/images/profile_default.jpg')
                        : Image.file(io.File(_storedImage!.path)).image,
                  ),
                ),
                Positioned(
                  left: 170,
                  bottom: 60,
                  child: CircleAvatar(
                    backgroundColor: organeColor,
                    child: IconButton(
                        onPressed: () {
                          pickImage(ImageSource.gallery);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: whtColor,
                        )),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
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
                            hintText: name,
                            hintStyle: TextStyle(color: lightGray),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 0)),
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
                        readOnly: true,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[250],
                            filled: true,
                            hintText: email,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: lightGray),
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 0)),
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
                            hintText: phone,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGray),
                                borderRadius: BorderRadius.circular(10)),
                            hintStyle: TextStyle(color: lightGray),
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 0)),
                        style: TextStyle(fontSize: 18, color: primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Save');

                      db.updateUser(
                          userid,
                          usernameController.text == ''
                              ? name
                              : usernameController.text,
                          phoneController.text == ''
                              ? phone
                              : phoneController.text);

                      Get.offAllNamed('/mainpage');
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
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

  void GetUserProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? temp = prefs.getString("ProfileImage");
    if (temp == null) {
      return;
    }

    setState(() {
      _storedImage = io.File(temp);
    });
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? ImagePicked = await ImagePicker().pickImage(source: source);
      if (ImagePicked == null) {
        return;
      }
      final ImageConvert = io.File(ImagePicked.path);

      setState(() {
        _storedImage = ImageConvert;
      });

      final appDocumentDirectory =
          await syspath.getApplicationDocumentsDirectory();
      final appDocumentPath = appDocumentDirectory.path;

      final ImageFile = await path.basename(ImageConvert.path);
      final LocalSave =
          await ImageConvert.copy("${appDocumentPath}/${ImageFile}");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('ProfileImage', LocalSave.path.toString());
    } on PlatformException catch (e) {
      print("Failed to pick the image: $e");
    }
  }
}
