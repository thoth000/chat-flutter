import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter/config/app_space.dart';

import 'package:chat_flutter/ui/molecules/home/list_tile.dart';

import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';

class FriendTileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final friendList = Provider.of<HomeController>(context).friendList;
    if (friendList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
        // ここのラップは適当にサイズ指定しているだけなので、レイアウトに合わせて変更する必要あり
        height: 220,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: AppSpace.small,
              ),
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: friendList.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return HomePageListTile(
                    name: friendList[index].name,
                    imgUrl: friendList[index].imgUrl,
                  );
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}
