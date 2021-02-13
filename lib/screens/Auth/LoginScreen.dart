import 'package:Trend/screens/Auth/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../TrendHome.dart';
import 'UserDetailsScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

_buildLoginSignupButtons() {
  return Container(
      child: Column(
    children: [],
  ));
}

class _LoginScreenState extends State<LoginScreen> {
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    if (box.read("logged_in") != null && box.read("logged_in") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Add Your Code here.
        Get.to(App());
        //this.dispose();
        return;
      });
      return;
    }
  }

  _buildLoginButton() {
    //sGet.toNamed('/signUpScreen' );
    return GestureDetector(
      onTap: () {
       Get.to(SignUpScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: Get.width,
        height: 55,
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(
                color: Color(0xffa0a0a0), fontWeight: FontWeight.w100 , fontSize: 18),
          ),
        ),
      ),
    );
  }

  _buildSignupButton() {
    return GestureDetector(
      onTap: () {
        Get.to(UserDetailsScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [Color(0xfff15a24), Color(0xffed1e79)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        width: Get.width,
        height: 55,
        child: Center(
          child: Text(
            "Signup",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w100, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background_fade.png"),
                    fit: BoxFit.fill)),
            child: Stack(children: [
              Positioned(
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 100),
                          width: 120,
                          child:
                              Image.asset("assets/images/travio_logo.png")))),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          margin: EdgeInsets.only(left : 20, right: 20, bottom: 50),
                          width: Get.width,
                          height: 120,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildLoginButton(),
                                _buildSignupButton()
                              ]))))
            ]),
          ),
        ),
      ),
    );
  }
}
