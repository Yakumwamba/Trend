import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:Trend/screens/Widgets/loadingStateIndicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';

class CurrentStreamInfo extends StatelessWidget {
  const CurrentStreamInfo({Key key}) : super(key: key);
  bool isFutureTime({String time}) {
    return DateTime.now().toUtc().isAfter(DateTime.parse(time));
  }

  @override
  Widget build(BuildContext context) {
    final streamInfo = Get.find<CurrentlyPlayingInfo>();
    //final radioStream = Get.find<RadioStreamController>();
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10),
      child: streamInfo.obx((state) {
        return TimerBuilder.periodic(
          Duration(
              seconds:
                  streamInfo.secondsRemainingToRefresh(endTime: state.endTime)),
          builder: (_) {
            if (isFutureTime(time: state.endTime)) {
              streamInfo.refresMediaInfo();
              // return Duration(seconds: difference).inSeconds;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  " ${state.artist} ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text("${state.title}",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal))
              ],
            );
          },
        );
      }, onLoading: Center(child: LoadingState())),
    );
  }
}
