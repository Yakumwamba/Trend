import 'package:Trend/data/Bindings/authBindings.dart';
import 'package:Trend/data/controllers/authController.dart';
import 'package:Trend/data/controllers/searchBarController.dart';
import 'package:Trend/data/controllers/userController.dart';
import 'package:Trend/data/streaminfo.dart';

import 'package:Trend/radio/flutter_radio_player.dart';
import 'package:Trend/utils/root.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

//import 'package:get_storage/get_storage.dart'
Future<void> main() async {
  //GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Get.put(StreamInfo());
    Get.put(FlutterRadioPlayer());
    Get.put(UserController());
    Get.put(AuthController(), permanent: true);


    //Get.put(VideoPlayerController());

    return GetMaterialApp(
        initialBinding: AuthBindings(),
        debugShowCheckedModeBanner: false,
        title: 'Travio',
        theme: ThemeData(
          primaryColor: Color(0xffF79F00),
          accentColor: Color(0xffffd544),
          fontFamily: 'Sofia_regular',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Center(
          child: Builder(builder: (BuildContext context) {
            return AnimatedSplashScreen(
                duration: 3000,
                splash: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                        height: Get.height,
                        child: Lottie.asset("assets/json/travio_splash.json")),
                  ),
                ),
                nextScreen: Root(),
                splashIconSize: Get.height,
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.white);
          }),
        ));
  }
}
