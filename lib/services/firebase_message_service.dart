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

  Stream<List<Message>> getMessageData(String roomId) {
    final Stream<QuerySnapshot> querySnapshot = _db
        .collection('message/v1/rooms/$roomId/transcripts')
        .orderBy('createdAt', descending: false)
        .snapshots();
    return querySnapshot.map((snapshot) {
      return snapshot.documents.map((doc) {
        return Message.fromJson(doc.data);
      }).toList();
    });
  }
}
