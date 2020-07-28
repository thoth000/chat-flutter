import 'package:chat_flutter/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMessageService {
  final Firestore _db = Firestore.instance;

  Future<void> setMessageData(Message message) async {
    final messageData = {
      'from': message.senderId,
      'to': message.roomId,
      'text': message.text,
      'createdAt': message.sendTime,
    };
    await _db
        .collection('message/v1/rooms/${message.roomId}/transcripts')
        .document()
        .setData(messageData);
  }

  Future<List<Map<String, dynamic>>> getMessageData(String roomId) async {
    final QuerySnapshot querySnapshot = await _db
        .collection('message/v1/rooms/$roomId/transcripts')
        .orderBy('createdAt', descending: false)
        .getDocuments();
    final List<Map<String, dynamic>> messageDataList = [];
    querySnapshot.documents.forEach((doc) {
      messageDataList.add(doc.data);
    });
    return messageDataList;
  }
}
