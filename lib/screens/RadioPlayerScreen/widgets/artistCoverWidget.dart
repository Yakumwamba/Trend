import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArtistCoverWidget extends StatelessWidget {
  final String imageUrl;

  const ArtistCoverWidget({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final streamInfo = Get.find<CurrentlyPlayingInfo>();
    return streamInfo.obx((_) {
      return Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            _.coverImage,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
        onLoading: Container(
          margin: EdgeInsets.only(left: 12, right: 12),
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/play_cover.png"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }
}
