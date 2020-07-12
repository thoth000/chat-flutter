import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class ProfileController with ChangeNotifier{
  ProfileController();

  Future<User> getUserById(String userId) async {
    User user = User(name: "test", imgUrl: "");

    await Future.delayed(Duration(seconds: 1));
    return await Future.value(user);
  }

  void changeProfileInfo(){
    //Firebaseへの変更通知
  }
}