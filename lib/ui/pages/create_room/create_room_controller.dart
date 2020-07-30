import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class CreateRoomController with ChangeNotifier {
  //検索時にユーザデータを取得しているのでユーザのリストにする。
  //メンバー判定用にidも合った方がいいかも
  List<User> members = [
    User(
      name: 'Alex',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
    User(
      name: 'Alex2',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
    User(
      name: 'Jack',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
    User(
      name: 'Brian',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
  ];

  List<User> searchedUser = [
    User(
      name: 'Alex',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
    User(
      name: 'Alex2',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
    User(
      name: 'Jack',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
    User(
      name: 'Brian',
      imgUrl:
          'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
    ),
  ];
  String roomName;
  //画像

  void addMember(User user) {
    //memberに既にいるか判定
    members.add(user);
    notifyListeners();
  }

  void removeMember(int index) {
    //memberから削除
  }

  void searchUser(String id) {
    //idサーチ
    //searchedUserにadd
  }

  void createRoom(List<String> member, String roomName) {
    //firebaseにRoom登録
    //各メンバーにroomオプションを追加
  }
}
