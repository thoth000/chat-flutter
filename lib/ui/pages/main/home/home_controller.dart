import 'package:chat_flutter/model/group.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getMeById('userId');
    getGroupList();
    getFriendList();
  }
  User user;
  List<Group> groupList;
  List<User> friendList;

  void getMeById(String userId) async {
    user = User(
      name: 'test',
      imgUrl: 'https://dot.asahi.com/S2000/upload/2019100100055_1.jpg',
    );
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> getGroupList() async {
    groupList = [
      Group(
        name: 'Sport',
        imgUrl: 'https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg',
      ),
      Group(
        name: 'Study',
        imgUrl: 'https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg',
      ),
      Group(
        name: 'Hobby',
        imgUrl: 'https://prtimes.jp/i/24101/70/resize/d24101-70-320114-0.jpg',
      ),
    ];
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    notifyListeners();
  }

  Future<void> getFriendList() async {
    friendList = [
      User(
        name: 'Alex',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
        isMe: false,
      ),
      User(
        name: 'Alex2(笑)',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
        isMe: false,
      ),
      User(
        name: 'Jack',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
        isMe: false,
      ),
      User(
        name: 'Brian',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
        isMe: false,
      ),
    ];
    await Future<dynamic>.delayed(const Duration(seconds: 5));
    notifyListeners();
  }
}
