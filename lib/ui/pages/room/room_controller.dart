import 'package:chat_flutter/model/message.dart';
import 'package:chat_flutter/services/messgae_service.dart';
import 'package:flutter/material.dart';

class RoomController extends ChangeNotifier {
  RoomController() {
    getMessageList();
  }
  List<Message> messageList;
  final MessageService _messageService = MessageService();

  Future<void> getMessageList() async {
    messageList = await _messageService.getMessage('roomId');
    notifyListeners();
  }

  Future<void> sendMessage(String message, String roomId) async {
    // ローカルに保存してそこから取得する？
    const String userId = 'userId';

    await _messageService.sendMessage(message, roomId, userId);
    notifyListeners();
  }
}
