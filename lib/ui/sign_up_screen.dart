import 'dart:ui';

import 'package:Trend/signupWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

import '../email_login_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with WidgetsBindingObserver {
  double _overlap = 0.0;
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final renderObject = context.findRenderObject();
    final renderBox = renderObject as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final widgetRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );

    final keyBoardTopPixel =
        window.physicalSize.height - window.viewInsets.bottom;
    final keyBoardTopPoint = keyBoardTopPixel / window.devicePixelRatio;
    final overlap = widgetRect.bottom - keyBoardTopPoint;

    if (overlap >= 0) {
      setState(() {
        _overlap = overlap;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: true,
        body: Padding(
          padding: EdgeInsets.only(bottom: _overlap),
          child: Center(child: EmailLoginWidget()),
        ));
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
  }
}
