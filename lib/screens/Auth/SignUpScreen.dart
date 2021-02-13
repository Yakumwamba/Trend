import 'package:Trend/data/controllers/authController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../TermsAndConditions.dart';
import '../../TrendHome.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({
    Key key,
    this.email,
    this.name,
  }) : super(key: key);

  final String email;
  final String name;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
//FocusNode focusNodeName;

  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _authController = Get.find<AuthController>();
  GetStorage box = GetStorage();
  final databaseReference = FirebaseFirestore.instance;
  String errorMessage = '';

  AnimationController controller;
  Animation<double> animation;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    // focusNodeName.requestFocu
    _isLoading = false;
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {});
    controller.repeat();
  }

_log({email, password}) {
  try {
     setState(() {
        _isLoading = true;
      });
    _authController.login(email, password);
  } catch (e) {
     setState(() {
        _isLoading = false;
      });
  } finally{
   
  }
  
}

  Future<void> _login({email, password}) async {
    //catch execptions
    try {
      setState(() {
        _isLoading = true;
      });
      final User user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        box.write("logged_in", true);
        box.write('email', user.email);
        box.write("username", user.displayName);
        box.write("loggin_type", "EMAIL");
        box.write("userId", user.uid);

        // Get.snackbar("Error", "Something went wrong, try again",
        //     colorText: Colors.white);

        if (box.read("ts_agreed") != null && box.read("ts_agreed") == true) {
          Get.to(App());
        } else {
          Get.to(TermsAndConditions());
        }
      } else {
        Get.snackbar("Error", "Something went wrong, try again");
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, please check your credentials!';
      if (err.message != null) {
        setState(() {
          _isLoading = false;
        });
        message = err.message;
        setState(() {
          errorMessage = message;
        });
        Get.snackbar("Error", message);
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      setState(() {
        errorMessage = err.toString();
      });
      Get.snackbar("Error", errorMessage,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  _buildEmailField({String label, TextEditingController controller}) {
    return new TextField(
      controller: _emailController,
      autofocus: true,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[800]),
          hintText: label,
          fillColor: Colors.white70),
    );
  }

  _buildPasswordField() {
    return new TextField(
      controller: _passwordController,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[800]),
          hintText: "Password",
          fillColor: Colors.white70),
    );
  }

  _buildLoginButton() {
    return GestureDetector(
      onTap: () {
        if (_emailController.text.isBlank || _passwordController.text.isBlank) {
          Get.snackbar("Error", "Email/Password required",
              colorText: Colors.white, backgroundColor: Colors.red);
          return;
        }
        //  Get.to(UserDetailsScreen());
        // Get.snackbar("Correct", "password", colorText: Colors.white);
        try {
          setState(() {
            _isLoading = true;
          });
          _log(
              email: _emailController.text, password: _passwordController.text);
        } on PlatformException catch (err) {
          setState(() {
            _isLoading = false;
          });
          var message = 'An error occurred, please check your credentials!';
          if (err.message != null) {
            message = err.message;
            setState(() {
              errorMessage = message;
            });
            Get.snackbar("Error", message);
          }
        }
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
            "Login",
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
              _isLoading
                  ? Positioned(
                      child: Align(
                      alignment: Alignment.topCenter,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.red,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xfff15a24),
                        ),
                        value: controller.value ?? 0.0,
                      ),
                    ))
                  : Container(),
              Positioned(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          margin: EdgeInsets.all(20),
                          width: Get.width,
                          height: 230,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                _buildEmailField(),
                                _buildPasswordField(),
                                _buildLoginButton()
                              ]))))
            ]),
          ),
        ),
      ),
    );
  }
}
