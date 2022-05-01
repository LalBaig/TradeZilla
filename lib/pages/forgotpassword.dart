import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trade_zilla/authentication/authenticate.dart';

import '../utilities/colors.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailcontroller = TextEditingController();
  final Authenticate auth = Authenticate();
  void showSnackBar(String title) {
    final snackBar = SnackBar(
      content: Text(title),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // ignore: deprecated_member_use
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 10),
          margin: EdgeInsets.only(top: 100, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Your Password? ",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: organeColor,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "No worries, you just need to type your email address and we will send the \nverification code. ",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: grey,
                  )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email:",
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[250],
                        filled: true,
                        hintText: 'abc@example.com',
                        hintStyle: TextStyle(color: lightGray),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGray),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGray),
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: EdgeInsets.only(left: 10, bottom: 0)),
                    style: TextStyle(fontSize: 18, color: primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  print("reset button clicked");
                  auth.ResetPassword(emailcontroller.text.trim());
                  showSnackBar(
                      'A password reset link has been sent to ${emailcontroller.text.trim()}');
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.offAllNamed('/beginscreen');
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange[400],
                    ),
                    child: Center(
                      child: Text(
                        'RESET MY PASSWORD',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: whtColor,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
