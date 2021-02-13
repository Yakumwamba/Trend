import 'package:Trend/data/Bindings/search_screen_binding.dart';
import 'package:Trend/screens/SearchScreen/search_screen.dart';
import 'package:Trend/ui/accounts_view.dart';
import 'package:Trend/ui/transitions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../trend_icons_icons.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

                        Get.to(SearchScreen(), binding: SearchScreenBinding());
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
    );
  }
}
