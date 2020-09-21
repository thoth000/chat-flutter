import 'dart:io';

import 'package:chat_flutter/model/storage_type.dart';
import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_storage_service.dart';
import 'package:chat_flutter/services/firebase_user_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController with ChangeNotifier {
  ProfileController(this.authenticator);
  User user;
  File selectedImageFile;
  Authenticator authenticator;
  FirebaseUserService firebaseUserService = FirebaseUserService();

  Future<String> getUserById() async {
    final String userId = await authenticator.getUid();
    if(userId.isEmpty){
      return '';
    }
    user = await firebaseUserService.getUserData(userId);
    notifyListeners();
    return 'success';
  }

  Future<void> selectProfileImage() async {
    final imagePicker = ImagePicker();
    final selectedImage =
        await imagePicker.getImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      selectedImageFile = File(selectedImage.path);
      notifyListeners();
    }
  }

  void notifySelectImage(String imagePath) {
    selectedImageFile = File(imagePath);
    notifyListeners();
  }

  Future<void> changeProfileInfo(String name) async {
    user.name = name;
    if (selectedImageFile != null) {
      user.imgUrl = await FirebaseStorageService().uploadImage(
        selectedImageFile,
        user.id,
        StorageType.user,
      );
    }
    await firebaseUserService.updateUserData(user);
    selectedImageFile = null;
    notifyListeners();
  }

  Future<void> signOut() async {
    await authenticator.signOut();
  }
}
