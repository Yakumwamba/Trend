import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:Trend/data/controllers/radioStreamController.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';

class RadioPlayerDisplay extends StatelessWidget {
  const RadioPlayerDisplay({Key key}) : super(key: key);

 



_buildCoverContainer () {


  return Expanded(
      child: Container(
     
      width: Get.width,
      color: Colors.white,
      child: Container(),
    ),
  );
}


_buildStreamInfoContainer() {

  return Container(
    
    width: Get.width,
    color: Colors.white,
    margin: EdgeInsets.only(top: 20),
    child: Container(),
  );
}
  @override
  Widget build(BuildContext context) {
    final streamInfo = Get.find<CurrentlyPlayingInfo>();
    final radioStream = Get.find<RadioStreamController>();
    return Expanded(
          child: Container(

        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                _buildCoverContainer(),
              
          ],
        ),
      ),
    );
  }
}



// Obx(() => Text(
//                       "Player Status : ${radioStream.isPlaying} \nPlayer is loading : ${radioStream.isLoading}",
//                       style: TextStyle(color: Colors.white),
//                     )),
//             Center(
//                 child: streamInfo.obx((state) {
//               return TimerBuilder.periodic(
                  // Duration(
                  //     seconds: streamInfo.secondsRemainingToRefresh(
                  //         endTime: state.endTime)), builder: (_) {
                // if (isFutureTime(time: state.endTime)) {
                //   streamInfo.refresMediaInfo();
                //   // return Duration(seconds: difference).inSeconds;
                // }

//                 return Column(
//                   children: [
//                     radioStream.initialized && !radioStream.isLoading.value
//                         ? GestureDetector(
//                             onTap: () {
//                               radioStream.play();
//                             },
//                             child: Container(
//                                 width: 100,
//                                 height: 30,
//                                 color: Colors.orange[300],
//                                 child: Center(child: Text("Play Stream"))),
//                           )
//                         : CircularProgressIndicator(),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         radioStream.stop();
//                       },
//                       child: Container(
//                           width: 100,
//                           height: 30,
//                           color: Colors.orange[600],
//                           child: Center(child: Text("Stop Stream"))),
//                     ),
                  
                  
//                   ],
//                 );
//               });
//             }, onError: (error) {
//               if (error.contains("SocketException")) {
//                 return Text(
//                   "[Please connect data]",
//                   style: TextStyle(color: Colors.white),
//                 );
//               }
//             },
//                     onLoading: AvatarGlow(
//                       startDelay: Duration(milliseconds: 500),
//                       glowColor: Color(0xfff15a24),
//                       endRadius: 100.0,
//                       duration: Duration(milliseconds: 700),
//                       repeat: true,
//                       showTwoGlows: true,
//                       repeatPauseDuration: Duration(milliseconds: 500),
//                       child: Text("Loading"),
//                     ))),