import 'package:flutter/material.dart';

class PositionCenter extends StatelessWidget {
  final Widget widget;

  const PositionCenter({Key key, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget,
        ],
      ),
    );
  }
}
