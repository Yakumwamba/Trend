import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:Trend/data/controllers/radioStreamController.dart';
import 'package:Trend/screens/RadioPlayerScreen/widgets/bottomBarWidget.dart';
import 'package:Trend/screens/RadioPlayerScreen/widgets/radio_player_widget.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';

import 'screens/RadioPlayerScreen/widgets/artistCoverWidget.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(color: Color(0xff191c2b)),
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Expanded(
                         flex: 1,
                         child: TopBarWidget()),
                       Expanded(
                         flex: 4,
                         child: ArtistCoverWidget()),
                       Expanded(
                         flex: 3,
                         child: BottomBarWidget())

                       //RadioPlayerDisplay()
                      ]))));
  }
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child:
                            Icon(TrendIcons.back_arrow, color: Colors.white),
                    ),
                    Container(
                      width: 130,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hi, Howard",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                TrendIcons.trend_user,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                      ),
                    )
                  ]),
    );
  }
}

// Container(
// height: Get.height,
// width: Get.width,
// decoration: BoxDecoration(color: Color(0xff191c2b)),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(30.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               child: Icon(TrendIcons.back_arrow,
//                                   color: Colors.white),
//                             ),
//                             Container(
//                               width: 130,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Hi, Howard",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                     softWrap: true,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       TrendIcons.trend_user,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ]),
//                     ),
//                     streamInfo.obx(
//             (state) {
//               return
//                     Center(
//                         child: TimerBuilder.periodic(
//                             Duration(
//                                 seconds: streamInfo.secondsRemainingToRefresh(
//                                     endTime: state.endTime)),
//                             builder: (context) {
//                       print("rebuilding this thing");
//                       // if (streamInfo.secondsRemainingToRefresh() ==
//                       //     Duration(seconds: 0)) {
//                       //   streamInfo.refresMediaInfo();
//                       // }
//                       //
//                       //streamInfo.refresMediaInfo();

//                       if (DateTime.now()
//                           .toUtc()
//                           .isAfter(DateTime.parse(state.endTime))) {
//                         print("hello work");
//                         streamInfo.refresMediaInfo();
//                         // return Duration(seconds: difference).inSeconds;
//                       }
//                       return Text(
//                           "This is the current playing artist : ${state.title}",
//                           style: TextStyle(fontSize: 20, color: Colors.white));
//                     },
//                         ))
