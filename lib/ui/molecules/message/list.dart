import 'package:chat_flutter/ui/molecules/message/list_item.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/message.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _getMessageList(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Message>> snapshot,
        ) {
          if (snapshot.hasData) {
            if (snapshot.data.length != 0) {
              return ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return MessageListItem(snapshot.data[index]);
                },
              );
            } else {
              return Container();
            }
          } else if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<List<Message>> _getMessageList() async {
    final List<Message> messageList = [
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

    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return Future.value(messageList);
  }
}
