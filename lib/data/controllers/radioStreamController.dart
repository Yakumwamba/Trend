import 'package:Trend/data/models/currentPlayingModel.dart';
import 'package:Trend/data/models/radioStreamModel.dart';
import 'package:Trend/radio/flutter_radio_player.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

import 'currentStreamController.dart';

class RadioStreamController extends GetxController
    with StateMixin<RadioStreamModel> {
  AssetsAudioPlayer radioStream;
  String _radioPlayerUrl = "https://listen.radioking.com/radio/341680/stream/390271";
  RxBool isPlaying = false.obs;
  RxBool isLoading = false.obs;

  Future<CurrentPlayingModel> mediaInfo;

  Future<CurrentPlayingModel> get getmediaInfo => this.mediaInfo;

  @override
  void onInit() async {
    super.onInit();
    isPlaying.value = false;
    //this.mediaInfo = Get.find<CurrentlyPlayingInfo>().mediaInfo;
    try {
      this.radioStream = AssetsAudioPlayer.newPlayer();
    } catch (t) {}

    // ever(isPlaying, (value) {
    //   if (value == true) {
    //     print("Now playing");
    //   }
    // });
  }

  void play() {
    if (this.radioStream.playerState.value == PlayerState.stop) {
      isLoading.value = true;
      radioStream.open(Audio.network(_radioPlayerUrl)).then((value) {
        radioStream.play().then((value) {
          isPlaying.value = true;
          isLoading.value = false;
          change(RadioStreamModel(), status: RxStatus.success());
        });
      });
      print(radioStream.playerState.value);
      ever(isPlaying, (value) {
        change(RadioStreamModel(), status: RxStatus.success());
      });
    }
  }

  void rewind() {
    if (radioStream.playerState.value == PlayerState.play) {
      radioStream.forwardOrRewind(-20);
      //change(CurrentPlayingModel(), status: RxStatus.success());
    }
  }

  void stop() {
    print(radioStream.realtimePlayingInfos.value);
    if (this.radioStream.playerState.value == PlayerState.play) {
      radioStream.stop().then((value) {
        isPlaying.value = false;
      });
      ever(isPlaying, (value) {
        change(RadioStreamModel(), status: RxStatus.success());
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    radioStream.dispose();
  }
}
