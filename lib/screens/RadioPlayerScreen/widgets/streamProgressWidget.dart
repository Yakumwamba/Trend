import 'package:flutter/material.dart';

class StreamProgressBar extends StatefulWidget {
  const StreamProgressBar({Key key}) : super(key: key);

  @override
  _StreamProgressBarState createState() => _StreamProgressBarState();
}

class _StreamProgressBarState extends State<StreamProgressBar>  with SingleTickerProviderStateMixin {

AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
          
        });
      });
    controller.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
          child: LinearProgressIndicator(
        backgroundColor: Color(0xffed1e79)..withOpacity(0.4),
        value: controller.value,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber,),
        minHeight: 2,
       
      )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    animation.removeListener(() { });
    super.dispose();
    
  }
}
