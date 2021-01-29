import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StreamingScreen extends StatefulWidget {
  @override
  _StreamingScreenState createState() => _StreamingScreenState();
}

class _StreamingScreenState extends State<StreamingScreen> {
  VideoPlayerController _controller;
  bool fullScreen = false;
  bool _isPlaying = false;
  bool _screenHasRotated = false;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
        .then((value) => _screenHasRotated = true);

    //fullScreen = false;
    _controller = VideoPlayerController.network(
      "https://www.youtube.com/watch?v=WjQL8sr_L9E&t=215s",
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((value) {
      _controller.play().then((value) => _isPlaying = true);
    });
  }

  @override
  void dispose() {
     super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown])
        .then((value) {
      _controller.dispose();
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _isPlaying
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      ClosedCaption(text: _controller.value.caption.text),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                      _PlayPauseOverlay(controller: _controller),
                      Positioned(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                    padding: EdgeInsets.all(20),
                                    child: Image.asset(
                                        "assets/images/leading.png")),
                              )))

                      // Positioned(
                      //     bottom: 20,
                      //     right: 100,
                      //     child: InkWell(
                      //       onTap: () {
                      //         setState(() {
                      //           fullScreen = !fullScreen;
                      //         });
                      //       },
                      //       child: Icon(
                      //         Icons.fullscreen_exit,
                      //         size: 35,
                      //         color: Colors.white,
                      //       ),
                      //     ))
                    ],
                  ))
              : Builder(builder: (context) {
                  if (_screenHasRotated) {
                    return Container(
                      height: Get.height,
                      width: Get.width,
                      child: Image.asset(
                        "assets/images/screen_example.jpg",
                        fit: BoxFit.fill,
                      ),
                    );
                  }
                  return Container();
                }),
        ),
      ),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
