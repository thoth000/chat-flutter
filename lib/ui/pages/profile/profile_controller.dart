import 'dart:io';

import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_storage_service.dart';
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
    notifyListeners();
  }

  Future<void> selectProfileImage() async {
    final imagePicker = ImagePicker();
    final selectImage = await imagePicker.getImage(source: ImageSource.gallery);
    if (selectImage != null) {
      image = File(selectImage.path);
      notifyListeners();
    }
  }

  void notifySelectImage(String imagePath) {
    image = File(imagePath);
    notifyListeners();
  }

  Future<void> changeProfileInfo(String name) async {
    final FirebaseStorageService firebaseStorageService =
        FirebaseStorageService();
    final FirebaseUserService firebaseUserService = FirebaseUserService();
    user.name = name;
    if (image != null) {
      user.imgUrl = await firebaseStorageService.uploadImage(
        image,
        'Kh2FY47Y0kak7zWB9bE7zY7FkCH3',
      );
    }
    await firebaseUserService.updateUserData(
      user.name,
      user.imgUrl,
      'Kh2FY47Y0kak7zWB9bE7zY7FkCH3',
    );
    image = null;
    notifyListeners();
  }

  Future<void> signOut() async {
    await authenticator.signOut();
  }
}
