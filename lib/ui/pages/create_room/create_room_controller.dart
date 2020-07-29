import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class CreateRoomController with ChangeNotifier{
  //検索時にユーザデータを取得しているのでユーザのリストにする。
  List<User> members = [User(
        name: 'Alex',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
        isMe: false,
      ),
      User(
        name: 'Alex2',
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
      ),];
  List<User> searchedUser = [User(
        name: 'Alex',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
        isMe: false,
      ),
      User(
        name: 'Alex2',
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
      ),];
  String roomName;
  //画像

  void addMember(User user){
    members.add(user);
    notifyListeners();
  }

  void removeMember(int index){
    //memberから削除
  }

  void searchUser(String id){
    //idサーチ
  }

  void createRoom(List<String> member, String roomName){
    //firebaseにRoom登録
    //各メンバーにroomオプションを追加
  }
}