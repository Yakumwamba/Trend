import 'package:Trend/data/controllers/searchBarController.dart';
import 'package:Trend/screens/SearchScreen/widgets/searchBarWidget.dart';
import 'package:Trend/screens/Widgets/bottomNavigation.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_results_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _searched = false;
  bool _showCancel = false;
  FocusNode _focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  _cancelEditing() {
    // _searchTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SearchBarController _searchController = Get.find<SearchBarController>();
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomNavigation(),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Color(0xff191c2b)),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                    height: 110,
                    width: Get.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "Search",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SearchBar()
                        ]),
                  ),
                  SizedBox(height: 20),
                  GetX<SearchBarController>(
                    init: SearchBarController(),
                    initState: (_) {},
                    builder: (_) {
                      print("Is loading : ${_.searching.value}");
                      return Expanded(
                        child: Container(
                            margin: EdgeInsets.all(10),
                            width: Get.width,
                            height: 500,
                            child: _.results.length > 0
                                ? GridView.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    children: List.generate(
                                        _.results.length, (index) {
                                      return SearchResultItem();
                                    }))
                                : _.searched.value ? Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      height: 200,
                                      width: 200,
                                      child: Image.asset(
                                          "assets/images/item_not_found.png", fit: BoxFit.contain,),
                                    )) : Container()),
                      );
                    },
                  )
                ]),
              ),
            )));
  }
}

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(SearchResultScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
                image: AssetImage("assets/images/tupac.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              color: Color(0xffcc191c2b).withOpacity(0.7),
              child: Center(
                child: Text(
                  "Tupac - Dear Mama",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
