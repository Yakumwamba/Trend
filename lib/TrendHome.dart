import 'package:Trend/screens/HomeScreen/home_screen.dart';

import 'package:Trend/ui/accounts_view.dart' hide TrendIcons;
import 'package:Trend/ui/transitions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:rate_my_app/rate_my_app.dart';

import 'screens/SearchScreen/search_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0, // Show rate popup on first day of install.
    minLaunches:
        2, // Show rate popup after 5 launches of app after minDays is passed.
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await rateMyApp.init();
      if (mounted && rateMyApp.shouldOpenDialog) {
        rateMyApp.showRateDialog(context,
            title: "Rate and Review us",
            message:
                "We would love to read what you think of our app. Please take some time to rate and review it. It really helps us and shouldn’t take more than a minute.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: 70,
          child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              //Navigator.of(context).push(Transitions.createRoute(AccountView()));
                            },
                            icon: Icon(
                              TrendIcons.travio_home,
                              color: Color(0xff707070),
                              size: 30,
                            )),
                        Text("Home")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(Transitions.createRoute(AccountView()));
                            },
                            icon: Icon(
                              TrendIcons.library_icon,
                              color: Color(0xff707070),
                              size: 30,
                            )),
                        Text("Library")
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            //Get.to( Settings());
                            Get.to(SearchScreen());
                          },
                          icon: Icon(
                            TrendIcons.search,
                            color: Color(0xff707070),
                            size: 30,
                          ),
                        ),
                        Text("Search")
                      ],
                    )
                  ],
                ),
              )),
        ),
        body: HomeScreen());
  }
}
