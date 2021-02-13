import 'package:Trend/data/models/userModel.dart';
import 'package:Trend/data/controllers/userController.dart';
import 'package:Trend/screens/HomeScreen/home_screen.dart';
import 'package:Trend/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserController _userControler = Get.find<UserController>();
  Rx<User> firebaseUser = Rx<User>();

  String get user => firebaseUser.value?.email;

  @override
  void onInit() {
     Firebase.initializeApp();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel _user = UserModel(
          id: result.user.uid,
          name: result.user.displayName,
          email: result.user.email);

      if (await Database().createUser(_user)) {
        _userControler.user = _user;
        Get.back();
      }

      Get.back();
    } catch (e) {
      Get.snackbar("Error creating account", e.message);
    }
  }

  void login(String email, String password) async {
    try {
      final _result = await _auth.signInWithEmailAndPassword(email: email, password: password);

      UserModel _user = await Database().getUser(_result.user.uid);
      _userControler.user = _user;
      // navigate to home

      Get.off(HomeScreen());
    } catch (e) {
      Get.snackbar("Error signing in", e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      _userControler.clear();
    } catch (e) {
      Get.snackbar("Error loging out", e.message);
    }
  }
}
