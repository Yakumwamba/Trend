import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:Trend/data/controllers/radioStreamController.dart';
import 'package:Trend/screens/RadioPlayerScreen/widgets/currentStreamInformationWidget.dart';
import 'package:Trend/screens/RadioPlayerScreen/widgets/radioStreamControlsWidget.dart';
import 'package:Trend/screens/RadioPlayerScreen/widgets/streamProgressWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final radioStream = Get.find<RadioStreamController>();
    print(radioStream.isPlaying);
    return Container(
      child: Column(
        children: [
          CurrentStreamInfo(),
          StreamProgressBar(),
          GetX<RadioStreamController>(builder: (_) => RadioStreamControls(),)
        ],
      ),
    );
  }
}
