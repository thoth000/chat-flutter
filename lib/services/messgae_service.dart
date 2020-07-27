import 'package:chat_flutter/interfaces/message_interface.dart';
import 'package:chat_flutter/model/message.dart';
import 'package:chat_flutter/services/firebase_message_service.dart';

class MessageService implements MessageInterface {
  @override
  Future<void> sendMessage(String text, String roomId, String senderId) async {
    final Message message = Message(
      message: text,
      senderId: senderId,
      roomId: roomId,
      sendTime: DateTime.now().toString(),
    );
    await FirebaseMessageService().setMessageData(message);
  }

  @override
  Future<Message> getMessage(String roomId) async {}
}
