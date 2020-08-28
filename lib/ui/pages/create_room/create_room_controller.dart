import 'dart:io';

import 'package:chat_flutter/model/room.dart';
import 'package:chat_flutter/model/storage_type.dart';
import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_room_service.dart';
import 'package:chat_flutter/services/firebase_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';
import 'package:image_picker/image_picker.dart';

class CreateRoomController with ChangeNotifier {
  CreateRoomController({this.authenticator});

  File selectedImageFile;
  Room room = Room();
  final Authenticator authenticator;
  final FirebaseRoomService _firebaseRoomService = FirebaseRoomService();

  Future<void> createRoom(List<User> members, String roomName) async {
    final imagePath = selectedImageFile != null
        ? await FirebaseStorageService()
            .uploadImage(selectedImageFile, 'sss', StorageType.room)
        : '';

    final List<String> memberIdList = members.map((member) {
      return member.id;
    }).toList();

    // 自分のIDを追加
    final String myId = await authenticator.getUid();
    memberIdList.add(myId);

    room = Room(
      name: roomName,
      members: memberIdList,
      imgUrl: imagePath,
      // 初めはブランクで入れておく
      lastMessage: '',
    );

    final String roomId = await _firebaseRoomService.setRoomData(room);

    await _firebaseRoomService.setRoomSetting(myId, roomId);
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
}
