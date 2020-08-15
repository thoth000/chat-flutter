import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_user_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

class ProfileController with ChangeNotifier {
  ProfileController(this.authenticator) {
    getUserById('testId');
  }
  User user;
  Authenticator authenticator;
  FirebaseUserService firebaseUserService = FirebaseUserService();

  Future<void> getUserById(String userId) async {
    user = await firebaseUserService.getUserData(userId);
    notifyListeners();
  }

  Future<void> changeProfileInfo(String s) async {
    //Firebaseへの変更通知
  }

  Future<void> signOut() async{
    await authenticator.signOut();
  }
}
