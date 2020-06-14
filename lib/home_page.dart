import 'package:flutter/material.dart';
import 'home_page_list_tile.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:chat_flutter/model/group.dart';

// ここ正直Stateなさそうだし、Statelessでもいいかも
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          HomePageListTile(
            name: 'name',
            imgUrl: 'https://dot.asahi.com/S2000/upload/2019100100055_1.jpg',
            isMe: true,
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 150,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Groups',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: _getGroupList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Group>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length != 0) {
                        return Container(
                          // ここのラップは適当にサイズ指定しているだけなので、レイアウトに合わせて変更する必要あり
                          height: 250,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    physics: ScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return HomePageListTile(
                                        name: snapshot.data[index].name,
                                        imgUrl: snapshot.data[index].imgUrl,
                                      );
                                    },
                                  ),
                                ]),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('グループがありません。'),
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
                  endIndent: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'Friends',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FutureBuilder(
                  future: _getFriendList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<User>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length != 0) {
                        return Container(
                          // ここのラップは適当にサイズ指定しているだけなので、レイアウトに合わせて変更する必要あり
                          height: 250,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    physics: ScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return HomePageListTile(
                                        name: snapshot.data[index].name,
                                        imgUrl: snapshot.data[index].imgUrl,
                                      );
                                    },
                                  ),
                                ]),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('友達がいません。'),
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

  Future<List<Group>> _getGroupList() async {
    // ここをFireBase or Cacheから取得
    final List<Group> groupList = [
      Group(
        name: "Sport",
        imgUrl: "https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg",
      ),
      Group(
        name: "Study",
        imgUrl: "https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg",
      ),
      Group(
        name: "Hobby",
        imgUrl: "https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg",
      ),
      Group(
        name: "Hobby",
        imgUrl: "https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg",
      ),
      Group(
        name: "Hobby",
        imgUrl: "https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg",
      ),
    ];
    // 仮でローディングしてるっぽい処理入れとく
    await Future.delayed(Duration(seconds: 1));

    return await Future.value(groupList);
  }

  Future<List<User>> _getFriendList() async {
    // ここをFireBase or Cacheから取得
    final List<User> friendList = [
      User(
        name: "Alex",
        imgUrl:
            "https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg",
        isMe: false,
      ),
      User(
        name: "Jack",
        imgUrl:
            "https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg",
        isMe: false,
      ),
      User(
        name: "Brian",
        imgUrl:
            "https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg",
        isMe: false,
      ),
      User(
        name: "Brian",
        imgUrl:
            "https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg",
        isMe: false,
      ),
      User(
        name: "Brian",
        imgUrl:
            "https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg",
        isMe: false,
      ),
    ];

    // 仮でローディングしてるっぽい処理入れとく
    await Future.delayed(Duration(seconds: 1));

    return Future.value(friendList);
  }
}
