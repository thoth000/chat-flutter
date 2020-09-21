import 'package:chat_flutter/model/message.dart';
import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:flutter/material.dart';

class RoomController extends ChangeNotifier {
  RoomController({this.messageService,this.authenticator}){
    Future(()async{
      userId = await authenticator.getUid();
      notifyListeners();
    });
  }
  final MessageService messageService;
  final Authenticator authenticator;
  String userId;

  Future<void> sendMessage(String message, String roomId) async {
    final String userId = await authenticator.getUid();
    await messageService.sendMessage(message, roomId, userId);
    notifyListeners();
  }

  Stream<List<Message>> messageList(String roomId) {
    return messageService.getMessage(roomId,userId);
  }
}
