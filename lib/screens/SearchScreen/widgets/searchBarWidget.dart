import 'package:Trend/data/controllers/searchBarController.dart';
import 'package:Trend/screens/Widgets/loadingStateIndicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../trend_icons_icons.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SearchBarController>(
        init: SearchBarController(),
        builder: (_) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: TextFormField(
                    onTap: () {
                      if (_.searched.value) {
                        _.searched.value = false;
                      }
                     // _.setSearching(true);
                    },
                    onFieldSubmitted: (item) {
                      _.searched.value = true;
                      _.showCancel.value = false;
                    },
                    onChanged: (search) {
                      if (!_.showCancel.value) {
                        _.showCancel.value = true;
                      }
                      _.query.value = search;
                    },
                    onEditingComplete: () {
                      _.search();
                   //  _.setSearching(true);
                    },
                    textInputAction: TextInputAction.search,
                    controller: _.searchTextController.value,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          TrendIcons.search,
                          color: Color(0xffa0a0a0).withOpacity(0.6),
                        ),
                      ),
                      fillColor: Colors.white,
                      hintText: "Artist,tracks,podcast",
                      hintStyle:
                          TextStyle(color: Color(0xffa0a0a0).withOpacity(0.6)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Color(0xffa0a0a0).withOpacity(0.6)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Color(0xffa0a0a0).withOpacity(0.6),
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                child: _.searching.value
                    ? Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: LoadingState(),
                        ),
                      )
                    : Visibility(
                        visible: _.showCancel.value,
                        child: GestureDetector(
                          onTap: () {
                            _.searchTextController.value.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Cancel",
                                style: TextStyle(
                                    color: Color(0xffa0a0a0).withOpacity(0.9))),
                          ),
                        ),
                      ),
              )
            ],
          );
        });
  }
}


