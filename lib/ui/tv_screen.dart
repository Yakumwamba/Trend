import 'package:Trend/settings.dart';
import 'package:Trend/trend_icons_icons.dart' as trend;
import 'package:Trend/ui/accounts_view.dart';
import 'package:Trend/ui/streamingScreen.dart';
import 'package:Trend/ui/transitions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///!!!!!!! ===== DOWNLOAD ASSETSS FOR THIS SCREEN
///
// TODO -
///
/// 1 - CREATE SCREEN FOR RMTP TESTING
/// 2 - GET RMTP PULL LINK FROM RESTREAM.IO
/// 3 - VIDEO ORIENTATION HORIZONTAL VERSUS POTRAIT
/// 4 -

class Tv_Screen extends StatelessWidget {
  //enum _premiumItems = [];

  _renderPlayButton({double size}) {
    return Container(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10, right: 20.0),
          child: Center(
            child: Icon(
              trend.TrendIcons.play_button,
              color: Color(0xffe54f4f),
              size: size + 2,
            ),
          ),
        ),
        height: size,
        width: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.30),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3),
              )
            ],
            color: Colors.white));
  }

  _renderPremiumItem(
      {@required String backgroundImage,
      String title,
      String description,
      context}) {
    return Column(children: [
      InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 10),
                            child: Container(
                              height: 36,
                              width: 36,
                              child: Image.asset(
                                  "assets/images/TV_SCREEN/close.png"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                                height: 50,
                                width: 180,
                                child: Image.asset(
                                  "assets/images/TV_SCREEN/discover2.png",
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                color: Color(0xffe54f4f),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/TV_SCREEN/trendicon.png")),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 213,
                              child: Text(
                                "Catch up on an array of exciting programmes from our library.",
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                    color: Color(0xff707070),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Container(
                            width: 313,
                            height: 54,
                            decoration: BoxDecoration(
                                color: Color(0xffe54f4f),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Upgrade to Premium",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: SizedBox(
                              width: 210,
                              child: Text(
                                "Your monthly membership starts as soon as you set up payment. 18+ years. Read Ts & Cs",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(150))),
                );
              });
        },
        child: Stack(
          children: [
            Container(
              height: 99,
              width: 153,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/TV_SCREEN/" + backgroundImage),
                      fit: BoxFit.contain)),
              padding: const EdgeInsets.all(8),
              child: const Text(''),
            ),
            Container(
              height: 99,
              width: 153,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Colors.white12,
                    Colors.white54,
                  ])),
              child: Center(child: _renderPlayButton(size: 33)),
            ),
          ],
        ),
      ),
      Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff707070), fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(description)
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  height: 72,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.30),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      Transitions.createRoute(AccountView()));
                                },
                                icon: Icon(
                                  trend.TrendIcons.trend_user,
                                  color: Color(0xff707070),
                                  size: 32,
                                )),
                            Text("Account")
                          ],
                        ),
                        SizedBox(
                          width: 45.1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(Transitions.createRoute(Settings()));
                                //Get.to( Settings());
                              },
                              icon: Icon(
                                trend.TrendIcons.trend_settings,
                                color: Color(0xff707070),
                                size: 32,
                              ),
                            ),
                            Text("Settings")
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: <Widget>[
                Container(
                  height: 280,
                  color: Colors.white70,
                ),
                Stack(children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/TV_SCREEN/1.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.4)
                        ])),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              "Music Videos",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 40),
                            SizedBox(
                              width: 230,
                              child: Text(
                                "Enjoy the stream of Music videos over and over... for free",
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    letterSpacing: 1,
                                    color: Colors.white),
                              ),
                            )
                          ]),
                    ),
                  )
                ]),
                Positioned(
                    bottom: 10,
                    left: 143,
                    child: InkWell(
                      onTap: () {
                        Get.to(StreamingScreen());
                      },
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10, right: 20.0),
                            child: Center(
                              child: Icon(
                                trend.TrendIcons.play_button,
                                color: Colors.orange,
                                size: 75,
                              ),
                            ),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.30),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                )
                              ],
                              color: Colors.white)),
                    )),
                Positioned(
                    top: 30,
                    left: 10,
                    child: Icon(
                      trend.TrendIcons.back_arrow,
                      color: Colors.white,
                      size: 30,
                    ))
              ]),
              //put everything in scroll view after prototype
              Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: 400,
                color: Color(0xfff4f4f4),
                child: Container(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 60,
                            width: 328,
                            child: Image.asset(
                              "assets/images/TV_SCREEN/discover.png",
                              fit: BoxFit.contain,
                            )),
                        SizedBox(height: 10),
                       
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                        _renderPremiumItem(
                            backgroundImage: '2.png',
                            title: "NAREP DISCUSSION:",
                            description:
                                "Views shared on this sponsored program do not necessarily represent the views of Trend TV",
                            context: context),
                            _renderPremiumItem(
                                backgroundImage: '3.png',
                                title: "SHI MUMBI:",
                                description:
                                    "Don’t shoot the messenger! Belinda threatens to cut a well-meaning friend into little pieces for the bad…",
                                context: context)
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _renderPremiumItem(
                                backgroundImage: '4.png',
                                title: "ZUBA:",
                                description: "Watch new episodes",
                                context: context),
                            _renderPremiumItem(
                                backgroundImage: '5.png',
                                title: "SHI MUMBI: ",
                                description: "Another episode ",
                                context: context)
                          ],
                        )
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}
