import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:Trend/data/controllers/radioStreamController.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class PlayScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RadioStreamController());
    Get.lazyPut(() => CurrentlyPlayingInfo());
  }
}
