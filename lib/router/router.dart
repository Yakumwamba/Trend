import 'package:Trend/screens/Auth/LoginScreen.dart';
import 'package:Trend/screens/Auth/SignUpScreen.dart';
import 'package:Trend/screens/DocumentariesScreen/documentaries_screen.dart';

import 'package:Trend/screens/HomeScreen/home_screen.dart';
import 'package:get/route_manager.dart';

class Router {

  static var routes = [
    GetPage(name: "/homeScreen", page: () => HomeScreen(), transition: Transition.zoom),
    GetPage(name: "/loginScreen", page: () => LoginScreen()),
    GetPage(name: "/signUpScreen", page: () => SignUpScreen()),
    GetPage(name: "/documentariesScreen", page: () => DocumentariesScreen())
  ];

  
}