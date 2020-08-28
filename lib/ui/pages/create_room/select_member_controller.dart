import 'package:chat_flutter/model/user.dart';
import 'package:flutter/material.dart';

class SelectMemberController extends ChangeNotifier {
  SelectMemberController() {
    getUser();
  }

  List<User> members = [];
  List<User> searchedUserList;

  void addMember(User user) {
    for (final member in members) {
      if (member.id == user.id) {
        return;
      }
    }
    members.add(user);
    notifyListeners();
  }

  void removeMember(User user) {
    members.remove(user);
    notifyListeners();
  }

  void getUser() {
    searchedUserList = [
      User(
        id: 'sss',
        name: 'Alex',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
      ),
      User(
        id: 'ttt',
        name: 'Alex2',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
      ),
      User(
        id: '444',
        name: 'Jack',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
      ),
      User(
        id: 'eee',
        name: 'Brian',
        imgUrl:
            'https://pbs.twimg.com/profile_images/581025665727655936/9CnwZZ6j.jpg',
      ),
    ];
  }

  void searchUser(String id) {}
}
