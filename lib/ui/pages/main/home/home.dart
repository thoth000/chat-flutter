import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/molecules/home/list_tile.dart';
import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyTile(),
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
                GroupTileList(),
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
                FriendTileList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<HomeController>(context).user;
    if (_user == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return HomePageListTile(
      name: _user.name,
      imgUrl: _user.imgUrl,
      isMe: true,
    );
  }
}

class GroupTileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _groupList = Provider.of<HomeController>(context).groupList;
    if (_groupList == null) {
      return Center(
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
              itemCount: _groupList.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return HomePageListTile(
                  name: _groupList[index].name,
                  imgUrl: _groupList[index].imgUrl,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FriendTileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _friendList = Provider.of<HomeController>(context).friendList;
    if (_friendList == null) {
      return Center(
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
                itemCount: _friendList.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return HomePageListTile(
                    name: _friendList[index].name,
                    imgUrl: _friendList[index].imgUrl,
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
