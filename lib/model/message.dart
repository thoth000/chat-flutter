class Message {
  String message;
  String sendTime;
  bool isMe;
  bool isRead;
  String senderId;
  String roomId;
  Message({
    this.message,
    this.sendTime,
    this.isMe,
    this.isRead,
    this.senderId,
    this.roomId,
  });
}
