import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trade_zilla/Models/user_class.dart';
import 'package:trade_zilla/authentication/authenticate.dart';
import 'package:trade_zilla/database/database.dart';
import 'package:trade_zilla/utilities/colors.dart';
import 'package:trade_zilla/utilities/constants.dart';
import 'package:trade_zilla/widgets/spinder.dart';

class AuthenticationClass extends StatefulWidget {
  const AuthenticationClass({Key? key}) : super(key: key);

  @override
  State<AuthenticationClass> createState() => _AuthenticationClassState();
}

class _AuthenticationClassState extends State<AuthenticationClass> {
  late final DatabaseHelper db;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool login = true;
  final loginformkey = GlobalKey<FormState>();
  final signupformkey = GlobalKey<FormState>();

  final Authenticate auth = Authenticate();
  bool isloading = false;
  late String FullName;
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  // String _constant_role;

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
  void initState() {
    super.initState();
    db = DatabaseHelper();
  }

  late String countryCode;
  @override
  Widget build(BuildContext context) {
    return isloading
        ? loading_spin()
        : Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: login ? logInWidget() : signUpWidget(),
                  ),
                ],
              ),
            ),
          );
  }

  Widget logInWidget() {
    return Form(
      key: loginformkey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign In",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: organeColor,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        } else if (value.length < 8) {
                          return 'Password length must be 8';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey[250],
                          filled: true,
                          hintText: '***********',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: lightGray),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: lightGray),
                              borderRadius: BorderRadius.circular(10)),
                          hintStyle: TextStyle(color: lightGray),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 0)),
                      style: TextStyle(fontSize: 18, color: primaryColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          print('forget password!');
                          Get.toNamed('/forgotpassword');
                        },
                        child: Text('Forgot Password?',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ))),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    print('Sign in');
                    if (loginformkey.currentState!.validate()) {
                      setState(() {
                        isloading = true;
                      });
                      dynamic result = await auth.Sign_In(
                          emailController.text, passwordController.text);
                      if (result == null) {
                        setState(() {
                          showSnackBar('This Email is not Registered');
                          isloading = false;
                        });
                      }
                    }
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
                        'SIGN IN',
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
          loggingChange(),
        ],
      ),
    );
  }

  Widget loggingChange() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            login ? "Don't have an account " : "Already have an account ",
            style: TextStyle(fontSize: 15, color: lightGray),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  login ? "Sign up" : "Log in",
                  style: TextStyle(fontSize: 16, color: organeColor),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                login = !login;
              });
            },
          )
        ],
      ),
    );
  }

  Widget signUpWidget() {
    return Form(
      key: signupformkey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 50),
            child: Text("Sign Up",
                style: GoogleFonts.lato(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: organeColor,
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: firstnameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please First Name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[250],
                                filled: true,
                                hintText: 'Shahid',
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
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last Name",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: lastnameController,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Last Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.grey[250],
                                filled: true,
                                hintText: 'Mehmood',
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
                    )
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Phone Number';
                        } else if (value.length < 10) {
                          return 'Invalid Phone Number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey[250],
                          filled: true,
                          hintText: '+923064568799',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: lightGray),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: lightGray),
                              borderRadius: BorderRadius.circular(10)),
                          hintStyle: TextStyle(color: lightGray),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 0)),
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
                      "Password",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        } else if (value.length < 8) {
                          return 'Password length must be 8';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.grey[250],
                          filled: true,
                          hintText: '***********',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: lightGray),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: lightGray),
                              borderRadius: BorderRadius.circular(10)),
                          hintStyle: TextStyle(color: lightGray),
                          contentPadding: EdgeInsets.only(left: 10, bottom: 0)),
                      style: TextStyle(fontSize: 18, color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    print('Sign up');
                    if (signupformkey.currentState!.validate()) {
                      setState(() {
                        isloading = true;
                      });
                      FullName = firstnameController.text +
                          " " +
                          lastnameController.text;

                      dynamic result = await auth.ResisterUser(
                          emailController.text,
                          passwordController.text,
                          FullName,
                          phoneController.text);

                      if (result == null) {
                        setState(() {
                          isloading = false;
                        });
                        showSnackBar('Please Enter Different Email');
                      } else if (auth.user != null) {
                        userid = auth.getUser();
                        print(userid);
                        db.insertUserData(UserData(
                            name: FullName,
                            email: emailController.text,
                            phone: phoneController.text,
                            uid: userid!));

                        Get.offAndToNamed('/mainpage');
                      }
                    }
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
                        'REGISTER',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: whtColor,
                        ),
                      )),
                ),
                loggingChange()
              ],
            ),
          )
        ],
      ),
    );
  }
}
