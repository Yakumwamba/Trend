import 'dart:convert';
import 'dart:ui';

import 'package:Trend/data/streaminfo.dart';
import 'package:Trend/login.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';

class EmailSignUpWidget extends StatefulWidget {
  @override
  _EmailSignUpWidgetState createState() => _EmailSignUpWidgetState();
}

class _EmailSignUpWidgetState extends State<EmailSignUpWidget>
    with WidgetsBindingObserver {


  final _auth = FirebaseAuth.instance;

  final databaseReference = FirebaseFirestore.instance;

  final GetStorage box = GetStorage();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _fullName = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _success;

  String _userEmail;
  double _overlap = 0;
  bool hideLogo = false;
  void _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        print("the user id generated is : ");
        print(user.uid);

        await databaseReference.collection("users").doc(user.uid).set({
          'fullname': _fullName.text,
        });

        user.updateProfile(displayName: "Test Display Name");
        Get.snackbar("Congratualtions", "Your account is ready");
        Get.to(LoginScreen());
      } else {}
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final renderObject = context.findRenderObject();
    final renderBox = renderObject as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );

    final keyBoardTopPixel =
        window.physicalSize.height - window.viewInsets.bottom;
    final keyBoardTopPoint = (keyBoardTopPixel ) / window.devicePixelRatio;
    final overlap = widgetRect.bottom - keyBoardTopPoint;

    if (overlap >= 0) {
      setState(() {
        _overlap = overlap;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _fullName,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "field cannot be empty";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'Name',
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 13)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Email required";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'Email',
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 13)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Password required";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'Password',
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 13)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (val) {
                          if (val != _passwordController.text ||
                              val.isEmpty) {
                            return "Passwords do not match";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 13)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color(0xfff79f00),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        gradient: LinearGradient(
                            colors: [Color(0xfff15a24), Color(0xffed1e79)],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          _register();
                          return;
                        }
                        Get.snackbar(
                            "Invalid", "Input email and password to login");
                      },
                      child: Center(
                          child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     if (_formKey.currentState.validate()) {
                  //       print("validated");
                  //       _register();
                  //       return;
                  //     }
                  //     print("Invalid inputs");
                  //   },
                  //   splashColor: Colors.white12,
                  //   child: Container(
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //         color: Color(0xfff79f00),
                  //         borderRadius:
                  //             BorderRadius.all(Radius.circular(6))),
                  //     child: Center(
                  //         child: Padding(
                  //       padding: const EdgeInsets.only(left: 10.0),
                  //       child: Text(
                  //         "Create Account",
                  //         style: TextStyle(
                  //           color: Color(0xff262626),
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     )

                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
