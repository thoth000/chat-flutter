import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class ProfileController with ChangeNotifier{
  ProfileController(){
    getUserById("testId");
  }
  User user;

  void getUserById(String userId) async {
    user = User(name: "test", imgUrl: "");
    await Future.delayed(Duration(seconds: 1));
    notifyListeners();
  }

  void changeProfileInfo() async{
    //Firebaseへの変更通知
  }
}