import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_color.dart';

class ProfilePageAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColor.baseColor,
      ),
      title: Text(
        "Profile",
        style: TextStyle(
          color: AppColor.baseColor,
          fontWeight: FontWeight.bold,
        ),
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
