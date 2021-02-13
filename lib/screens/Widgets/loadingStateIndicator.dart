import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: new AlwaysStoppedAnimation<Color>(
            Color(0xfff15a24)),
        backgroundColor: Color(0xffed1e79),
      ),
    );
  }
}