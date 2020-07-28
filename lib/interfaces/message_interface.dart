import 'package:chat_flutter/model/message.dart';

abstract class MessageInterface {
  Future<List<Message>> getMessage(String roomId);

  Future<void> sendMessage(String text, String roomId, String senderId);
}
