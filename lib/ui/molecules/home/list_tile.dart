import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/config/app_text_size.dart';
import 'package:flutter/material.dart';

class HomePageListTile extends StatelessWidget {
  //HomePageListTileが受け取る型がUserとGroupの二つあるのでmodelとしている
  final String name;
  final String imgUrl;
  final bool isMe;

  const HomePageListTile({
    this.name,
    this.imgUrl,
    this.isMe = false, //デフォルトでfalseに設定
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpace.small,
          vertical: isMe ? AppSpace.large : AppSpace.small,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: isMe ? 60 : 50,
              width: isMe ? 60 : 50,
              child: CircleAvatar(
                radius: double.infinity,
                backgroundImage: NetworkImage(imgUrl),
              ),
            ),
            const SizedBox(
              width: AppSpace.midium,
            ),
            Flexible(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: isMe ? AppTextSize.xlarge : AppTextSize.midium,
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
