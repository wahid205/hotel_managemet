// ignore_for_file: prefer_const_constructors

//import 'dart:html';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widget/google_signin.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  bool isLoading = false;
  bool VisablePass = true;


    @override


  bool isPassword8Char = false;
  bool isPasswordHas1Number = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  onPasswordChanged(String password) {
    isPassword8Char = false;
    isPasswordHas1Number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordHas1Number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }

      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    emailController.dispose();
    passController.dispose();
    fullnameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Future<UserCredential> signInWithFacebook() async {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }

    final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.purple,
          decoration: BoxDecoration(
              ),
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.369),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Text("Sign up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 57, 57, 57),
                                    fontFamily: "myfont")),
                            SizedBox(
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                width: 285,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.name,
                                  obscureText: false,
                                  controller: fullnameController,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.blue[800],
                                      ),
                                      hintText: "Full Name",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                width: 285,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  validator: (value) {
                                    return value != null &&
                                            !EmailValidator.validate(value)
                                        ? "Enter a valid email"
                                        : null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: false,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.mail,
                                        color: Colors.blue[800],
                                      ),
                                      hintText: "Email",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                width: 285,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.phone,
                                  obscureText: false,
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.blue[800],
                                      ),
                                      hintText: "Phone No.",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                width: 285,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.streetAddress,
                                  obscureText: false,
                                  controller: addressController,
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.location_city,
                                        color: Colors.blue[800],
                                      ),
                                      hintText: "Stress Address",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                width: 285,
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: TextFormField(
                                  onChanged: (password) {
                                    onPasswordChanged(password);
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  controller: passController,
                                  obscureText: VisablePass,
                                  decoration: InputDecoration(
                                      suffix: IconButton(
                                        iconSize: 20,
                                        padding: EdgeInsets.only(top: 20),
                                        onPressed: () {
                                          setState(() {
                                            VisablePass = !VisablePass;
                                          });
                                        },
                                        icon: VisablePass
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        color: Colors.blue[900],
                                      ),
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.blue[800],
                                        size: 19,
                                      ),
                                      hintText: "Password",
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: 293,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(21),
                                    topRight: Radius.circular(21),
                                    bottomLeft: Radius.circular(21),
                                    bottomRight: Radius.circular(21),
                                  ),
                                  color: Color.fromRGBO(54, 67, 72, 60),
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isPassword8Char
                                              ? Colors.green
                                              : Colors.white,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 189, 189, 189)),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Text("At least 8 characters",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isPasswordHas1Number
                                              ? Colors.green
                                              : Colors.white,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 189, 189, 189)),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Text("At least 1 number",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: hasUppercase
                                              ? Colors.green
                                              : Colors.white,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 189, 189, 189)),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Text("Has Uppercase",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: hasLowercase
                                              ? Colors.green
                                              : Colors.white,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 189, 189, 189)),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Text("Has  Lowercase",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: hasSpecialCharacters
                                              ? Colors.green
                                              : Colors.white,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 189, 189, 189)),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Text("Has  Special Characters ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text("Already have an account? ",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Login()),
                                            );
                                          },
                                          child: Text(" Sign in",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white)))
                                    ],
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                    );
                                  
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 50, 95, 116)),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          horizontal: 106, vertical: 10)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(27))),
                                ),
                                child: isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Sign Up",
                                        style: TextStyle(fontSize: 24),
                                      ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 17,
                      ),
                      SizedBox(
                        width: 299,
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Expanded(
                                child: Divider(
                              thickness: 0.6,
                              color: Colors.white,
                            )),
                            Text(
                              "OR",
                              style: TextStyle(color: Colors.white),
                            ),
                            Expanded(
                                child: Divider(
                              thickness: 0.6,
                              color: Colors.white,
                            )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 27),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  ),
                                  color: Color.fromRGBO(54, 67, 72, 99),
                                ),
                                child: Image.asset(
                                  "assets/images/apple_pic.png",
                                  height: 27,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            GestureDetector(
                              onTap: () {
                                googleSignInProvider.googlelogin();
                              },
                              child: Container(
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  ),
                                  color: Color.fromRGBO(54, 67, 72, 99),
                                ),
                                child: Image.asset(
                                  "assets/images/google_pic.png",
                                  height: 27,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await signInWithFacebook();
                              },
                              child: Container(
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                  ),
                                  color: Color.fromRGBO(54, 67, 72, 99),
                                ),
                                child: Image.asset(
                                  "assets/images/facebook_pic.png",
                                  height: 27,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
