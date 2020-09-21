import 'package:chat_flutter/model/message.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:flutter/material.dart';

class RoomController extends ChangeNotifier {
  RoomController({this.messageService});
  final MessageService messageService;

  Future<void> sendMessage(String message, String roomId) async {
    // ローカルに保存してそこから取得する？
    const String userId = 'userId';

    await messageService.sendMessage(message, roomId, userId);
    notifyListeners();
  }

  Stream<List<Message>> messageList(String roomId) {
    return messageService.getMessage(roomId);
  }
}
