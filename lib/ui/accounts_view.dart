import 'package:Trend/agreedTermsOfUse.dart';
import 'package:Trend/data/streaminfo.dart';
import 'package:Trend/login.dart';
import 'package:Trend/ui/transitions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../TermsAndConditions.dart';
import 'package:Trend/ui/manage_account.dart';

import 'package:Trend/trend_icons_icons.dart' as Trend;

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  StreamInfo info = Get.find();
  GetStorage box = GetStorage();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: " ",
      subject: "Content Submittion from ${box.read('firstname')}",
      recipients: ["trend@trendonlineradio.com"],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email).then((value) {});
      platformResponse = 'Thanks will get back to you!';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        platformResponse,
        style: TextStyle(color: Colors.orange[400], fontSize: 14),
      ),
      backgroundColor: Colors.grey[100],
    ));

    print(platformResponse);
  }

  Future<void> _logout() async {
    if (box.read("loggin_type") == "GOOGLE") {
      googleSignIn.signOut().then((value) {
        box.write("logged_in", false).then((value) {
          Get.to(LoginScreen()).then((value) {
            box.remove("logged_in");
            box.remove("username");
            box.remove("firstname");
            box.remove("lastname");
            box.remove("logged_in");
            box.remove("email");
            box.remove("photoUrl");
            box.remove("loggin_type");
            box.write("logged_in", false);
            box.write("ts_agreed", false);
          });
        });
      });
    } else {
      await FirebaseAuth.instance.signOut().then((value) => {
            box.write("ts_agreed", false),
            box.write("logged_in", false).then((value) {
              Get.to(LoginScreen()).then((value) {
                box.remove("logged_in");
                box.remove("username");
                box.remove("firstname");
                box.remove("lastname");
                box.remove("logged_in");
                box.remove("email");
                box.remove("photoUrl");
                box.remove("loggin_type");
                box.write("logged_in", false);
                box.write("ts_agreed", false);
              });
            })
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String _text = authState.getDisplayName;
    // String _email = authState.getEmailAddress;
    // String _url = authState.getImageUrl;

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            body: SingleChildScrollView(
              child: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/background.png"))),
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/images/background_fade.png"))),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: Get.width,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.asset("assets/images/leading.png"),
                                ),
                              )),
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Account",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Push notifications",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                    CustomSwitch(
                                        activeColor: Color(0xfff15a24),
                                        onChanged: (changed) {
                                          return true;
                                        },
                                        value: true),
                                  ],
                                ),
                                Container(
                                  color: Color(0xff707070).withOpacity(.6),
                                  height: 1,
                                  width: Get.width,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            send();
                          },
                          child: Container(
                            width: Get.width,
                            height: 65,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Get in touch",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white)),
                                  Container(
                                    color: Color(0xff707070).withOpacity(.6),
                                    height: 1,
                                    width: Get.width,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(AgreedConditions());
                          },
                          child: Container(
                            width: Get.width,
                            height: 65,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Terms & Conditions",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100,
                                          color: Colors.white)),
                                  Container(
                                    color: Color(0xff707070).withOpacity(.6),
                                    height: 1,
                                    width: Get.width,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _logout();
                          },
                          child: Container(
                            width: Get.width,
                            height: 45,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 8.0, right: 8, top: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sign out",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.white),
                                  ),
                                  Container(
                                    color: Color(0xff707070).withOpacity(.6),
                                    height: 1,
                                    width: Get.width,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            )));

// Container(
//             child: Column(
//               children: <Widget>[
//                 Expanded(
//                   flex: 2,
//                   child: Stack(children: <Widget>[
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10)),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.010),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: Offset(0, 3),
//                           )
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             "Account",
//                             style: TextStyle(
//                                 fontFamily: 'Sofia_bold',
//                                 fontSize: 20,
//                                 color: Color(0xff707070)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                         left: 10,
//                         top: 10,
//                         child: IconButton(
//                           color: Color(0xff707070),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(
//                             Trend.TrendIcons.cancel_button,
//                             size: 20,
//                           ),
//                         )),
//                   ]),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () {
//                       send();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(18),
//                       color: Colors.white,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Get in touch",
//                             style: TextStyle(
//                               fontSize: 14,
//                             ),
//                           ),
//                           Icon(Trend.TrendIcons.forwad_button,
//                               color: Color(0xfff79f00), size: 15)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () {
//                       Get.to(AgreedConditions());
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(18),
//                       color: Color(0xFFfafafa),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Terms & Conditions"),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: InkWell(
//                     onTap: () async {
//                       _logout();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(18),
//                       color: Colors.white,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Sign Out"),
//                           Icon(Trend.TrendIcons.forwad_button,
//                               color: Color(0xfff79f00), size: 15),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
// Container(
//   height: 72,
//   width: 72,
//   decoration: BoxDecoration(
//     color: Colors.orange,
//     borderRadius: BorderRadius.circular(100),
//   ),
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(100),
//     child: CachedNetworkImage(
//       fit: BoxFit.cover,
//       height: 72,
//       width: 72,
//       imageUrl: box.read("photoUrl") == null
//           ? ""
//           : box.read("photoUrl"),
//       progressIndicatorBuilder:
//           (context, url, downloadProgress) =>
//               CircularProgressIndicator(
//                   value: downloadProgress.progress),
//       errorWidget: (context, url, error) =>
//           Icon(Icons.error),
//     ),
//   ),
// ),
  }
}
