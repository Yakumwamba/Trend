import 'package:Trend/trend_icons_icons.dart';
import 'package:Trend/ui/accounts_view.dart' as Account;

import 'package:Trend/ui/streamingScreen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../play_screen.dart';
import '../../data/controllers/featuredScreenController.dart';

final GetStorage box = GetStorage();
final FeaturedVideosController featuredVideoController = Get.find();

class FeaturedScreen extends StatefulWidget {
  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  // final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    var username = box.read("username");

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: 900,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black, Color(0xFF313131)]),
          ),
          child: Column(children: [
            Container(
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
                ],
              ),
            ),
            FeaturedWidget()
          ]),
        ),
      ),
    );
  }
}

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
          Expanded(
              child: GetBuilder<FeaturedVideosController>(
            init: FeaturedVideosController(),
            initState: (_) {},
            builder: (_) {
              return FutureBuilder(
                  future: _.getFeaturedVideos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        shrinkWrap: true,
                        children: List.generate(snapshot.data.length, (index) {
                          var title = snapshot.data[index].data()['title'];
                          var video_url =
                              snapshot.data[index].data()['video_url'];
                          return FeaturedItem(
                            title: title,
                            video_url: video_url,
                          );
                        }),
                      );
                    }
                  });
            },
          )),
        ],
      ),
    );
  }
}

class FeaturedItem extends StatelessWidget {
  final String title;
  final String video_url;
  const FeaturedItem({Key key, this.title, this.video_url}) : super(key: key);

  void addVideoToFavourites() {
    if (box.read("userId") != null) {
      var userId = box.read("userId");
      print("addding video to favourites");
      featuredVideoController.addVideoToFavourites(userId, {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("taped on video: ${title}");
        // addVideoToFavourites();
      },
      child: Container(
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: 160,
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
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 160,
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
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w100)),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: addVideoToFavourites,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// StreamBuilder(
//     stream: Firestore.instance.collection("products").snapshots(),
//     builder: (context, snapshot) {},
//             );
// builder: (context, snapshot) {
//   return !snapshot.hasData
//       ? Text('PLease Wait')
//       : ListView.builder(
//           itemCount: snapshot.data.documents.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot products =
//                 snapshot.data.documents[index];
//             return ProductItem(
//               name: products['name'],
//               imageUrl: products['imageURL'],
//               price: products['price'],
//               discription: products['description'],
//             );
//           },
//         );
// },
