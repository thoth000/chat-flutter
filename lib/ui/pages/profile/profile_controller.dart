import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class ProfileController with ChangeNotifier {
  ProfileController() {
    getUserById('testId');
  }
  User user;

  Future<void> getUserById(String userId) async {
    user = User(name: 'test', imgUrl: '');
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> changeProfileInfo(String s) async {
    //Firebaseへの変更通知
  }
}
