import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class CreateRoomListTile extends StatelessWidget {
  final User user;

  const CreateRoomListTile({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      //userをメンバーに追加する処理
      //ただcreate_room.dartでも使われているため迷い
      onPressed: (){},
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.small),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                radius: double.infinity,
                backgroundImage: NetworkImage(user.imgUrl),
              ),
            ),
            const SizedBox(
              width: AppSpace.midium,
            ),
            Expanded(
              child: Text(
                user.name,
                style: TextStyle(
                  fontSize: AppTextSize.midium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
