import 'package:chat_flutter/config/app_space.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class AddFriendListTile extends StatelessWidget {
  final String name;
  final String imgUrl;
  AddFriendListTile({
    this.name,
    this.imgUrl,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(AppSpace.small),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                radius: double.infinity,
                backgroundImage: NetworkImage(imgUrl),
              ),
            ),
            SizedBox(
              width: AppSpace.midium,
            ),
            Flexible(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: AppTextSize.midium,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
