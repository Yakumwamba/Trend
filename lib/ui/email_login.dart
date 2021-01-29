import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:video_player/video_player.dart';

import '../email_login_widget.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
// TODO 5: Override the initState() method and setup your VideoPlayerController

  GetStorage box = GetStorage();
  @override
  void initState() {
    super.initState();
    if (box.read("logged_in") == 'true') {
      // Get.to(TrendHome());
    }
    // Pointing the video controller to our local asset.
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      
      // TODO 6: Create a Stack Widget
      body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: EmailLoginWidget()),
              )
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
  }
}
