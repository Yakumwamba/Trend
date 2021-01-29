import 'dart:convert';

import 'package:Trend/TermsAndConditions.dart';
import 'package:Trend/TrendHome.dart';
import 'package:Trend/data/streaminfo.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';

class EmailLoginWidget extends StatefulWidget {
  const EmailLoginWidget({
    Key key,
  }) : super(key: key);

  @override
  _EmailLoginWidgetState createState() => _EmailLoginWidgetState();
}

class _EmailLoginWidgetState extends State<EmailLoginWidget> {
  //GetStorage box = GetStorage();

  // String your_client_id = "381667702819164";
  // String redirect_url = "https://www.facebook.com/connect/login_success.html";

  StreamInfo info = Get.find();
  final _auth = FirebaseAuth.instance;

  GetStorage box = GetStorage();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _success;
  String _userEmail;
  var LOGIN_SCREEN = 1;
  var REGISTER_SCREEN = 2;
  var CURRENT_SCREEN = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(box.read("logged_in"));
    var CURRENT_SCREEN = 0;
  }
// @override
// void initState() {
  // super.initState();
  // if(  box.read("logged_in") == "true") {
  //  // info.getTrackInfo();
  //   Get.to(TermsAndConditions());
  // }
  //    info.getTrackInfo();
// }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // box.dispose();
  }

  void _login() async {
    //catch execptions
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        box.write("logged_in", true);
        box.write('email', user.email);
        box.write('username', 'Howard');
        box.write("loggin_type", "EMAIL");
        box.write("userId", user.uid);

        if (box.read("ts_agreed") != null && box.read("ts_agreed") == true) {
          Get.to(TrendHome());
        } else {
          Get.to(TermsAndConditions());
        }
      } else {
        Get.snackbar("Error", "Something went wrong, try again");
      }
    } catch (e) {
      Get.log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: 'Insert email',
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 15)),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              hintText: 'Insert password',
                              hintStyle: TextStyle(fontSize: 15),
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 15)),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
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
                            _login();
                            return;
                          }
                          Get.snackbar(
                              "Invalid", "Input email and password to login");
                        },
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
