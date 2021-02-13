import 'dart:developer';

import 'package:Trend/data/models/currentPlayingModel.dart';
import 'package:Trend/services/currentMediaRepo.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class CurrentlyPlayingInfo extends GetxController
    with StateMixin<CurrentPlayingModel> {
  // Artist name
  // Song title
  // Album title
  // start time
  // end time
  final String _mediaUrl =
      "https://api.radioking.io/widget/radio/trendradio/track/current";

  RxBool refreshMedia = false.obs;
  Future<CurrentPlayingModel> mediaInfo;


  Stopwatch timeToRefresh;
  @override
  void onInit() {
    
    super.onInit();
    //refresMediaInfo();
    try {
      this.mediaInfo = getMediaInfo(_mediaUrl);
    } catch (e) {
      print(e);
    }
  }

  Future<CurrentPlayingModel> getMediaInfo(String mediaUrl) async {
    return CurrentMediaRepo(mediaUrl: _mediaUrl)
        .getMediaInfo()
        .then((mediaInfo) {
      //this.mediaInfo = mediaInfo;
      change(mediaInfo, status: RxStatus.success());
      print(mediaInfo.durationSeconds);
      print(mediaInfo.artist);
      refreshMedia.value = true;
      //  interval(Rx<CurrentPlayingModel>(), (state){
      //    print("calling function again");
      //  }, time: Duration(seconds: mediaInfo.durationSeconds.toInt()) );
    }).catchError((error) {
      print("Error was caught");
      change(null, status: RxStatus.error(error));
    });
  }

  secondsRemainingToRefresh({String startTime, String endTime}) {
    var end = DateTime.parse(endTime).toUtc();
    //var start = DateTime.parse(startTime).toUtc();
    if (!DateTime.now().toUtc().isAfter(end)) {
      int difference = end.difference(DateTime.now().toUtc()).inSeconds;
      print("difference till refresh  ${difference.toString()}");
      return Duration(seconds: difference).inSeconds;
    } else {
      Duration(seconds: 1).inSeconds;
    }
  }

  refresMediaInfo() {
    getMediaInfo(_mediaUrl);
  }
}
