import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CreatePasswordScreen.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({Key key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
//FocusNode focusNodeName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // focusNodeName.requestFocus();
  }

  _buildEmailField() {
    return new TextField(
      controller: _emailController,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[800]),
          hintText: "Email",
          fillColor: Colors.white70),
    );
  }

  _buildNameField() {
    return new TextField(
      controller: _nameController,
      autofocus: true,
      decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Colors.grey[800]),
          hintText: "Name",
          fillColor: Colors.white70),
    );
  }

  _buildContinueButton(context) {
    return GestureDetector(
      onTap: () {
        var _email = _emailController.text;
        var _name = _nameController.text;
        if (_email.isBlank || _name.isBlank) {
          Get.snackbar("Missing fields", "Please provide Name and Email",
              colorText: Colors.white);
          return;
        }
        if (!EmailValidator.validate(_email)) {
          Get.snackbar("Invalid Email", "Please provide a valid email address.",
              colorText: Colors.white);
          return;
        }

        Get.to(CreatePasswordScreen(
          email: _email,
          name: _name,
        ));
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
            "Continue",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w100, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: EdgeInsets.all(20),
                        width: Get.width,
                        height: 230,
                        child: Form(
                          key: _formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enter your details",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                                _buildNameField(),
                                _buildEmailField(),
                                _buildContinueButton(context)
                              ]),
                        ))))
          ]),
        ),
      ),
    );
  }
}
