import 'package:chat_flutter/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMessageService {
  final Firestore _db = Firestore.instance;

  Future<void> setMessageData(Message message) async {
    final Map<String, String> messageData = {
      'from': message.senderId,
      'to': message.roomId,
      'text': message.message,
      'createdAt': message.sendTime,
    };
    await _db
        .collection('message/v1/rooms/${message.roomId}/transcripts')
        .document()
        .setData(messageData);
  }

  Future<void> getMessageData(String roomId) {}
}
