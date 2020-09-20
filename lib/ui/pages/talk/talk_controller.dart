import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_room_service.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/room.dart';

class TalkController with ChangeNotifier {
  TalkController(this.authenticator) {
    Future(() async{
      uid = await authenticator.getUid();
      roomList = await firebaseRoomService.getMyRoomList(uid);
      notifyListeners();
    });
  }

  final FirebaseRoomService firebaseRoomService = FirebaseRoomService();
  Authenticator authenticator;
  String uid;
  List<Future<Room>> roomList;
}
