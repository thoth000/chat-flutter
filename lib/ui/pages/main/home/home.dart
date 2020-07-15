import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/molecules/home/list_tile.dart';
import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _MyTile(),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 180,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: AppSpace.midium,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSpace.midium,
                  ),
                  child: Text(
                    'Groups',
                    style: TextStyle(
                      fontSize: AppTextSize.small,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _GroupTileList(),
                Divider(
                  endIndent: AppSpace.big,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSpace.midium,
                  ),
                  child: Text(
                    'Friends',
                    style: TextStyle(
                      fontSize: AppTextSize.small,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _FriendTileList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<HomeController>(context).user;
    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return HomePageListTile(
      name: user.name,
      imgUrl: user.imgUrl,
      isMe: true,
    );
  }
}

class _GroupTileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groupList = Provider.of<HomeController>(context).groupList;
    if (groupList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
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
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: groupList.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return HomePageListTile(
                  name: groupList[index].name,
                  imgUrl: groupList[index].imgUrl,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FriendTileList extends StatelessWidget {
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
                scrollDirection: Axis.vertical,
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
