import 'package:Trend/TermsAndConditions.dart';
import 'package:Trend/TrendHome.dart';
import 'package:Trend/email_login_widget.dart';
import 'package:Trend/signupWidget.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:Trend/ui/transitions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:video_player/video_player.dart';

class LoginScreenx extends StatefulWidget {
  LoginScreenx({Key key}) : super(key: key);
  @override
  _LoginScreenx createState() => _LoginScreenx();
}

class _LoginScreenx extends State<LoginScreenx> {
  VideoPlayerController _controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  GetStorage box = GetStorage();

  bool _emailLogin = false;
  bool isInitialized = false;
  bool _signUp = false;
  bool _continueWithEmail = true;

  // TODO 5: Override- the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    bool _signUp = false;
    _continueWithEmail = true;
    // Pointing the video controller to our local asset.
    Get.log("user is not logged in ${box.read("logged_in")}");
    if (box.read("logged_in") != null && box.read("logged_in") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Add Your Code here.
        Get.to(App());
        //this.dispose();
        return;
      });
      return;
    } else {
      _controller =
          VideoPlayerController.asset("assets/videos/login_video_animation.mp4")
            ..initialize().then((_) {
              //  _controller.
              // Once the video has been loaded we play the video and set looping to true.
              _controller.setLooping(true);

              _controller.play();
              box.write("first_load", true);
              setState(() {
                isInitialized = true;
              });
              // Ensure the first frame is shown after the video is initialized.
            });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
        onWillPop: () async {
          setState(() {
            _signUp = false;
            _continueWithEmail = true;
            _emailLogin = false;
            //_back = true;
          });
          return false;
        },
        child: Scaffold(
          resizeToAvoidBottomPadding: true,
          resizeToAvoidBottomInset: true,
          // TODO 6: Create a Stack Widget
          body: Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.

              Positioned(
                child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xFFf79f00),
                            Color(0XFFe54f4f),
                          ]),
                    ),
                    child: Builder(builder: (BuildContext context) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        // Add Your Code here.

                        setState(() {
                          //_controller.play();
                        });
                      });
                      return SizedBox.expand(
                        child: FittedBox(
                            // If your background video doesn't look right, try changing the BoxFit property.
                            // BoxFit.fill created the look I was going for.
                            fit: BoxFit.fill,
                            child: SizedBox(
                              width: isInitialized
                                  ? _controller.value.size?.width ?? 0
                                  : 0,
                              height: isInitialized
                                  ? _controller.value.size?.height ?? 0
                                  : 0,
                              child: isInitialized
                                  ? VideoPlayer(_controller)
                                  : Container(),
                            )),
                      );
                    })),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Container(
                        child: Image.asset(
                      'assets/logo/logo.png',
                      fit: BoxFit.fill,
                      width: 200,
                    )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: 350,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                          visible: !_continueWithEmail && !_signUp,
                          child: EmailLoginWidget()),
                      Visibility(
                          visible: !_continueWithEmail && _signUp,
                          child: EmailSignUpWidget()),

                      // // Visibility(
                      // //     visible: !_back && !_visible_signup,
                      // //     child: SizedBox(
                      // //       height: 65,
                      // //     )),
                      Visibility(
                        visible: _continueWithEmail && !_emailLogin,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _continueWithEmail = false;

                              _signUp = false;
                            });
                            //continueWithEmail();
                          },
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              color: Colors.white,
                              boxShadow: [],
                            ),
                            child: Center(
                              child: Text(
                                "Login with email",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: _continueWithEmail,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _continueWithEmail = false;
                              _emailLogin = false;
                              _signUp = true;
                            });
                            //continueWithEmail();
                          },
                          child: Container(
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              color: Colors.white,
                              boxShadow: [],
                            ),
                            child: Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
// TODO 8: Override the dipose() method to cleanup the video controlle

// Future<String> signInWithGoogle() async {
//   //await Firebase.initializeApp();

//   //_controller.dispose();
//   if (box.read("logged_in") == "true" && box.read("ts_agreed") == true) {
//     Get.to(TrendHome()).then((value) {
//       _controller.dispose();
//     });
//   } else {
//     final GoogleSignInAccount googleSignInAccount =
//         await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );

//     final UserCredential authResult =
//         await _auth.signInWithCredential(credential);
//     final User user = authResult.user;

//     if (user != null) {
//       assert(!user.isAnonymous);
//       assert(await user.getIdToken() != null);

//       var firstname = user.displayName.split(" ")[0];
//       var lastname = user.displayName.split(" ")[1];
//       var email = user.email;
//       var photoUrl = user.photoURL;
//       var userId = user.uid;
//       box.write("username", user.displayName);
//       box.write("firstname", firstname);
//       box.write("lastname", lastname);
//       box.write("logged_in", true);
//       box.write("email", email);
//       box.write("photoUrl", photoUrl);
//       box.write("loggin_type", "GOOGLE");
//       box.write("userId", userId);

//       final User currentUser = _auth.currentUser;
//       assert(user.uid == currentUser.uid);

//       Widget trendHomeOrTermsAndConditions =
//           box.read("ts_agreed") != null && box.read("ts_agreed") == true
//               ? TrendHome()
//               : TermsAndConditions();
//       print('signInWithGoogle succeeded: $user');
//       Navigator.of(context)
//           .push(Transitions.createRoute(trendHomeOrTermsAndConditions))
//           .then((value) {
//         _controller.dispose();
//       });

//       return '$user';
//     }

//     return null;
//   }
// }
