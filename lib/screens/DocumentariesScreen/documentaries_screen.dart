import 'dart:math';

import 'package:Trend/ui/streamingScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentariesScreen extends StatelessWidget {
  const DocumentariesScreen({Key key}) : super(key: key);

  String getRandomImage({bool isBig = false}) {
    return "https://picsum.photos/id/${Random().nextInt(50)}/${isBig ? "800/800" : "200/200"}";
  }

  Widget _grid() {
    return SliverPadding(
      padding: EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            var imageUrl = "assets/images/girl1.jpg";
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: [
                    // BoxShadow(
                    //   color: Colors.black54,
                    //   offset: Offset(2, 2),
                    //   spreadRadius: 2,
                    //   blurRadius: 4,
                    // ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Hero(
                    tag: index,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: 50,
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Color(0xfff15a24).withOpacity(.7),
      automaticallyImplyLeading: false,
      leading: Image.asset(
        "assets/images/leading.png",
      ),
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text(
            "Documentaries",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        background: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                "assets/images/documentaries.png",
                fit: BoxFit.fill,
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
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 70,
                  child: Image.asset(
                    "assets/images/play.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // child: DecoratedBox(
              //   decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [Colors.transparent, Colors.deepPurpleAccent],
              //   stops: [0, 100],
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              // ),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff313131), Colors.black87],
            stops: [0, 100],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
          ),
          // image: DecorationImage(
          //   image: AssetImage('assets/images/background_fade.png'),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: CustomScrollView(
          slivers: [_appBar(), _grid()],
        ),
      )
          // body: Stack(
          //   children: [
          //     SizedBox(
          //       height: 200,
          //       width: Get.width,
          //       child: Container(
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage('assets/images/mampi2.jpg'),
          //             fit: BoxFit.fill,
          //             alignment: Alignment.lerp(
          //                 Alignment.center, Alignment.topLeft, 0.30),
          //             // colorFilter: ColorFilter.mode(
          //             //     Colors.black.withOpacity(0.2), BlendMode.darken))
          //           ),
          //         ),
          //         width: Get.width,
          //       ),
          //     ),
          //     Container(
          //       height: 200,
          //       width: Get.width,
          //       child: Image.asset(
          //         "assets/images/overlay.png",
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //     Positioned.fill(
          //       child: GestureDetector(
          //         onTap: () => Get.to(StreamingScreen()),
          //         child: Center(
          //           child: Container(
          //             width: 70,
          //             child: Image.asset(
          //               "assets/images/play.png",
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned.fill(
          //         child: Align(
          //       alignment: Alignment.topRight,
          //       child: Container(width: 130, child: Text("s")),
          //     )),
          //     Positioned.fill(
          //       child: Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Container(
          //           margin: EdgeInsets.only(bottom: 30),
          //           width: 250,
          //           child: Text(
          //             "Music over & over...",
          //             textAlign: TextAlign.center,
          // style: TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 22),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          ),
    );
  }
}
