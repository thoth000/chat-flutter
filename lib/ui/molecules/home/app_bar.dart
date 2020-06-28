import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_color.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      backgroundColor: AppColor.backColor,
      title: Text(
        "Chat",
        style: TextStyle(
          color: AppColor.baseColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
          ),
          color: AppColor.baseColor,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
          ),
          color: AppColor.baseColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
