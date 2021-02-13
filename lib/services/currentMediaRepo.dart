import 'package:get/get_connect/connect.dart';

import 'package:Trend/data/models/currentPlayingModel.dart';

class CurrentMediaRepo extends GetConnect {
  String mediaUrl;

  CurrentMediaRepo({
    this.mediaUrl,
  });
  
  Future<CurrentPlayingModel> getMediaInfo() async {
    final response = await get(mediaUrl);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      return CurrentPlayingModel.fromJson(response.body);
      
    }
  }
}
