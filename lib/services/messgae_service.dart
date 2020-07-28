import 'package:chat_flutter/interfaces/message_interface.dart';
import 'package:chat_flutter/model/message.dart';
import 'package:chat_flutter/services/firebase_message_service.dart';

class MessageService implements MessageInterface {
  @override
  Future<void> sendMessage(String text, String roomId, String senderId) async {
    final Message message = Message(
      text: text,
      senderId: senderId,
      roomId: roomId,
      sendTime: DateTime.now(),
    );
    await FirebaseMessageService().setMessageData(message);
  }

  @override
  Future<List<Message>> getMessage(String roomId) async {
    final messageDataList =
        await FirebaseMessageService().getMessageData(roomId);
    final List<Message> messageList = [];
    messageDataList
        .forEach((json) => {messageList.add(Message.fromJson(json))});
    return messageList;
  }
}
