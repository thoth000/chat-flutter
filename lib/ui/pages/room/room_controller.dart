import 'package:chat_flutter/model/message.dart';
import 'package:flutter/material.dart';

class RoomController extends ChangeNotifier {
  RoomController() {
    getMessageList();
  }
  List<Message> messageList;

  Future<void> getMessageList() async {
    /// TODO Firebaseからの取得に置き換える
    messageList = [
      Message(
        message: 'amusement park!!!',
        sendTime: '23:00',
        isMe: true,
        isRead: true,
      ),
      Message(
        message: 'make it possible with canon',
        sendTime: '23:03',
        isMe: false,
        isRead: true,
      ),
      Message(
        message: 'あなたと、コンビに、ファミリーマート',
        sendTime: '23:07',
        isMe: true,
        isRead: false,
      ),
    ];
    await Future<dynamic>.delayed(const Duration(seconds: 2));
    notifyListeners();
  }

  Future<void> sendMessage(String message) {
    /// TODO Firebaseへの処理に置き換える
    notifyListeners();
  }
}
