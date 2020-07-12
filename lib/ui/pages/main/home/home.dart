import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/molecules/home/list_tile.dart';
import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:chat_flutter/model/group.dart';

import 'package:chat_flutter/config/app_text_size.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeController = Provider.of<HomeController>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: _homeController.getMeById('test'),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: // データの取得まち
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                default:
                  if (snapshot.hasData) {
                    return HomePageListTile(
                      name: snapshot.data.name,
                      imgUrl: snapshot.data.imgUrl,
                      isMe: true,
                    );
                  } else {
                    return Center(
                      child: Text("該当するユーザーがいません"),
                    );
                  }
              }
            },
          ),
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
                FutureBuilder(
                  future: _homeController.getGroupList(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<Group>> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length != 0) {
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
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (
                                    BuildContext context,
                                    int index,
                                  ) {
                                    return HomePageListTile(
                                      name: snapshot.data[index].name,
                                      imgUrl: snapshot.data[index].imgUrl,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: AppSpace.large,
                            top: AppSpace.small,
                            bottom: AppSpace.small,
                          ),
                          child: Text(
                            'グループがありません',
                          ),
                        );
                      }
                    } else if (snapshot.connectionState !=
                        ConnectionState.done) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
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
                FutureBuilder(
                  future: _homeController.getFriendList(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<List<User>> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length != 0) {
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
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (
                                    BuildContext context,
                                    int index,
                                  ) {
                                    return HomePageListTile(
                                      name: snapshot.data[index].name,
                                      imgUrl: snapshot.data[index].imgUrl,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: AppSpace.large,
                            top: AppSpace.small,
                            bottom: AppSpace.small,
                          ),
                          child: Text(
                            '友達がいません',
                          ),
                        );
                      }
                    } else if (snapshot.connectionState !=
                        ConnectionState.done) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
