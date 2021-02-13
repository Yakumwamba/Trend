import 'package:Trend/data/controllers/searchBarController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchBarController());
  }
}
