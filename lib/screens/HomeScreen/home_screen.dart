import 'package:Trend/data/Bindings/playScreenBindings.dart';
import 'package:Trend/data/controllers/authController.dart';
import 'package:Trend/data/controllers/currentStreamController.dart';
import 'package:Trend/data/controllers/userController.dart';
import 'package:Trend/data/models/userModel.dart';
import 'package:Trend/screens/DocumentariesScreen/documentaries_screen.dart';
import 'package:Trend/screens/MusicVideosScreen/music_videos.dart';
import 'package:Trend/screens/Widgets/bottomNavigation.dart';
import 'package:Trend/ui/accounts_view.dart' as Account;

import 'package:Trend/ui/streamingScreen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../play_screen.dart';
import '../../trend_icons_icons.dart';
import '../FeaturedScreen/featured_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = Get.find<AuthController>();

  final GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var username = box.read("username");
    print("");
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        height: 240,
                        width: Get.width,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/screen_example.jpg'),
                              fit: BoxFit.fill,
                              alignment: Alignment.lerp(
                                  Alignment.center, Alignment.topLeft, 0.30),
                              // colorFilter: ColorFilter.mode(
                              //     Colors.black.withOpacity(0.2), BlendMode.darken))
                            ),
                          ),
                          width: Get.width,
                        ),
                      ),
                      Container(
                        height: 240,
                        width: Get.width,
                        child: Image.asset(
                          "assets/images/overlay.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () => {
                            Get.to(FeaturedScreen())
                          }, //Get.to(StreamingScreen()),
                          child: Center(
                            child: Container(
                              width: 70,
                              child: Image.asset(
                                "assets/images/play.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Hi, ${username}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                              IconButton(
                                onPressed: () => Get.to(Account.AccountView()),
                                icon: Icon(
                                  TrendIcons.trend_user,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 30),
                            width: 250,
                            child: Text(
                              "Why Zambia's future has been mortgaged by President Lungu",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Our selections",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(MusicVideosScreen()),
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
                                        borderRadius: BorderRadius.circular(11),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/mampi.jpg',
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
                                        padding: EdgeInsets.only(bottom: 20.0),
                                        child: Text("Music Videos",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(DocumentariesScreen()),
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
                                        borderRadius: BorderRadius.circular(11),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/girl1.jpg',
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
                                        padding: EdgeInsets.only(bottom: 20.0),
                                        child: Text("Documentaries",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100)),
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
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14, right: 14, bottom: 14),
                    child: Container(
                        width: Get.width,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.8),
                                spreadRadius: 10,
                                blurRadius: 20,
                                offset:
                                    Offset(1, 3), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: AssetImage('assets/images/listen_mic.png'),

                              fit: BoxFit.fill,
                              alignment: Alignment.lerp(
                                  Alignment.center, Alignment.topLeft, 0.30),

                              // colorFilter: ColorFilter.mode(
                              //     Col\ors.black.withOpacity(0.2), BlendMode.darken))
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () => Get.to(PlayScreen(),
                                binding: PlayScreenBindings()),
                            child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(TrendIcons.listen,
                                          color: Colors.white, size: 65),
                                    ),
                                    Text("Radio",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20,
                                            letterSpacing: 0.5))
                                  ]),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
