import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class ProfileController with ChangeNotifier {
  ProfileController(this.authenticator) {
    getUserById('testId');
  }
  User user;
  Authenticator authenticator;

  Future<void> getUserById(String userId) async {
    user = User(name: 'test', imgUrl: '');
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> changeProfileInfo(String s) async {
    //Firebaseへの変更通知
  }

  Future<void> signOut() async{
    await authenticator.signOut();
  }
}
