import 'package:chat_flutter/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRoomService {
  final Firestore _db = Firestore.instance;

  Future<void> setRoomData(Room room) async {
    final roomData = {
      'name': room.name,
      'members': room.members,
      'imgUrl': room.imgUrl,
      'lastMessage': room.lastMessage,
    };
    await _db.collection('message/v1/rooms').add(roomData);
  }
}
