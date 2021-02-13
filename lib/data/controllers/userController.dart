import 'package:Trend/data/models/userModel.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = Rx<UserModel>();

  UserModel get user => _userModel.value;

  set user(UserModel user) => this._userModel.value = user;

  void clear() {
    _userModel.value = UserModel();
  }
}
