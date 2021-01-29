import 'package:Trend/trend_icons_icons.dart';
import 'package:Trend/ui/accounts_view.dart' as Account;

import 'package:Trend/ui/streamingScreen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../play_screen.dart';

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  // final Controller controller = Get.put(Controller());

  final GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var username = box.read("username");

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Color(0xFF313131)]),
            ),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/background_fade.png'),
                fit: BoxFit.fill,
                alignment:
                    Alignment.lerp(Alignment.center, Alignment.topLeft, 0.30),
                // colorFilter: ColorFilter.mode(
                //     Colors.black.withOpacity(0.2), BlendMode.darken))
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 280,
                        width: Get.width,
                        child: Container(
                          height: 240,
                          width: Get.width,
                        ),
                      ),
                      Container(
                        height: 240,
                        width: Get.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('assets/images/screen_example.jpg'),
                          fit: BoxFit.fill,
                          alignment: Alignment.lerp(
                              Alignment.center, Alignment.topLeft, 0.30),
                          // colorFilter: ColorFilter.mode(
                          //     Colors.black.withOpacity(0.2), BlendMode.darken))
                        )),
                        child: Image.asset(
                          "assets/images/overlay.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(StreamingScreen());
                              },
                              child: Container(
                                  margin: EdgeInsets.all(15),
                                  height: 60,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xfff15a24),
                                            Color(0xffed1e79)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topRight),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                              "assets/images/play_small.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "Start watching",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Featured",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/propose.jpg',
                                              ),
                                              fit: BoxFit.fill,
                                              // colorFilter: ColorFilter.mode(

                                              //     Colors.black.withOpacity(0.5),
                                              //     BlendMode.multiply)
                                              // colorFilter: ColorFilter.mode(
                                              //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/shadow.png',
                                          ),
                                          fit: BoxFit.fill,
                                          // colorFilter: ColorFilter.mode(

                                          //     Colors.black.withOpacity(0.5),
                                          //     BlendMode.multiply),

                                          // colorFilter: ColorFilter.mode(
                                          //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                        )),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.0),
                                            child: Text(
                                                "Why your man Isn't proposing",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w100)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/intimidated.jpg',
                                              ),
                                              fit: BoxFit.fill,
                                              // colorFilter: ColorFilter.mode(

                                              //     Colors.black.withOpacity(0.5),
                                              //     BlendMode.multiply),

                                              // colorFilter: ColorFilter.mode(
                                              //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/shadow.png',
                                          ),
                                          fit: BoxFit.fill,
                                          // colorFilter: ColorFilter.mode(

                                          //     Colors.black.withOpacity(0.5),
                                          //     BlendMode.multiply),

                                          // colorFilter: ColorFilter.mode(
                                          //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                        )),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.0),
                                            child: Text(
                                                "Are men intimidated by higher earning women?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w100)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/body.jpg',
                                              ),
                                              fit: BoxFit.fill,
                                              // colorFilter: ColorFilter.mode(

                                              //     Colors.black.withOpacity(0.5),
                                              //     BlendMode.multiply)
                                              // colorFilter: ColorFilter.mode(
                                              //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/shadow.png',
                                          ),
                                          fit: BoxFit.fill,
                                          // colorFilter: ColorFilter.mode(

                                          //     Colors.black.withOpacity(0.5),
                                          //     BlendMode.multiply),

                                          // colorFilter: ColorFilter.mode(
                                          //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                        )),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.0),
                                            child: Text(
                                                "Feminine care body care routine",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w100)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => {},
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            borderRadius:
                                                BorderRadius.circular(11),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/hard.jpg',
                                              ),
                                              fit: BoxFit.fill,
                                              // colorFilter: ColorFilter.mode(

                                              //     Colors.black.withOpacity(0.5),
                                              //     BlendMode.multiply),

                                              // colorFilter: ColorFilter.mode(
                                              //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                            )),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        width: 150,
                                        height: 180,
                                        decoration: BoxDecoration(
                                            // gradient: LinearGradient(
                                            //     begin: Alignment.bottomCenter,
                                            //     end: Alignment.topCenter,
                                            //     colors: [
                                            //       Colors.white12,
                                            //       Colors.black26,
                                            //     ]),
                                            image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/shadow.png',
                                          ),
                                          fit: BoxFit.fill,
                                          // colorFilter: ColorFilter.mode(

                                          //     Colors.black.withOpacity(0.5),
                                          //     BlendMode.multiply),

                                          // colorFilter: ColorFilter.mode(
                                          //     Colors.black.withOpacity(0.2), BlendMode.darken))
                                        )),
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.0),
                                            child: Container(
                                              width: 100,
                                              child: Text(
                                                  "Hard to date Zambian men?",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w100)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildBottomContent() {
    return Container(
      child: Text("asd"),
    );
  }
}
