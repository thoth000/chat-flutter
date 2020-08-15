import 'dart:io';

import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_user_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController with ChangeNotifier {
  ProfileController(this.authenticator) {
    //TODO:仮ID削除
    getUserById('Kh2FY47Y0kak7zWB9bE7zY7FkCH3');
  }
  User user;
  File image;
  Authenticator authenticator;
  FirebaseUserService firebaseUserService = FirebaseUserService();

  Future<void> getUserById(String userId) async {
    user = await firebaseUserService.getUserData(userId);
    print(user.name);
    print(user.imgUrl);
    notifyListeners();
  }

  Future<void> selectProfileImage() async{
    final imagePicker = ImagePicker();
    final selectImage = await imagePicker.getImage(source: ImageSource.gallery);
    image = File(selectImage.path);
    user.imgUrl=selectImage.path;
    notifyListeners();
  }

  Future<void> changeProfileInfo(String name) async {
    user.name = name;
    notifyListeners();
    //Firebaseへの変更通知
  }


  Future<void> signOut() async{
    await authenticator.signOut();
  }
}
