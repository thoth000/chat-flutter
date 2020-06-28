import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_color.dart';

class TalkPageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      backgroundColor: Colors.white,
      title: Text(
        "Talk",
        style: TextStyle(
          color: AppColor.baseColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColor.baseColor
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.more_vert,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
