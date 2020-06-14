import 'package:flutter/material.dart';

class HomePageListTile extends StatelessWidget {
  //HomePageListTileが受け取る型がUserとGroupの二つあるのでmodelとしている
//  final model;
//  HomePageListTile(
//    this.model,
//  );

  // modelだと命名が曖昧なので、modelではなく個別の値を渡す
  // 加えてisMeをmodelに持ちたくないので、isMeを渡すようにしている
  final String name;
  final String imgUrl;
  final bool isMe;

  HomePageListTile({this.name, this.imgUrl, this.isMe = false});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: isMe ? 30 : 10,
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
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: isMe ? 30 : 20,
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
