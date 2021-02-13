import 'package:Trend/data/controllers/authController.dart';
import 'package:get/instance_manager.dart';

class AuthBindings extends Bindings {


  @override
  void dependencies() {
   Get.lazyPut(() => AuthController);
  }


}