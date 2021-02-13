import 'package:Trend/data/controllers/authController.dart';
import 'package:Trend/data/controllers/userController.dart';
import 'package:Trend/screens/Auth/LoginScreen.dart';
import 'package:Trend/screens/HomeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetX(initState: (_) async {

    }, builder: (_) {
      if (authController.user != null) {
        return HomeScreen();
      } else {
        return LoginScreen();
      }
    });
  }
}
