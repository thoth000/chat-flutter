import 'package:chat_flutter/model/group.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier{
  HomeController();

  Future<User> getMeById(String userId) async {
    User user = User(name: "test", imgUrl: "");

    await Future.delayed(Duration(seconds: 1));
    return await Future.value(user);
  }

  Future<List<Group>> getGroupList() async {
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
    ];

    await Future.delayed(Duration(seconds: 1));
    return await Future.value(groupList);
  }

  Future<List<User>> getFriendList() async {
    final List<User> friendList = [
      User(
        name: "Alex",
        imgUrl:
            "https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg",
        isMe: false,
      ),
      User(
        name: "Alex2(笑)",
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
    ];

    await Future.delayed(Duration(seconds: 3));
    return await Future.value(friendList);
  }
}