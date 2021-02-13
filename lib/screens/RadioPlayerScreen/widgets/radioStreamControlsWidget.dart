import 'package:Trend/data/controllers/radioStreamController.dart';
import 'package:Trend/screens/Widgets/loadingStateIndicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../trend_icons_icons.dart';

class RadioStreamControls extends StatelessWidget {
  const RadioStreamControls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildRewindButton(),
              _buildPlayButton(),
              _buildForwardButton()
            ],
          ));
  
  }

  _buildRewindButton() {
    return Container(
        width: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/rewind_button.png"),
            Text(
              "-20",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }

  _buildPlayButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          child: Image.asset(
        "assets/images/play_button.png",
        fit: BoxFit.contain,
      )),
    );
  }

  _buildForwardButton() {
    return Container(
      width: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "+20",
            style: TextStyle(color: Colors.grey),
          ),
          Image.asset("assets/images/forward_button.png"),
        ],
      ),
    );
  }
}
