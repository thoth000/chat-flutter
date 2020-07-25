import 'package:chat_flutter/ui/molecules/message/list_item.dart';
import 'package:chat_flutter/ui/pages/room/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messageList = Provider.of<RoomController>(context).messageList;
    if (messageList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (messageList.length == 0) {
      return Container();
    } else {
      return Expanded(
        child: ListView.builder(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: messageList.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return MessageListItem(messageList[index]);
          },
        ),
      );
    }
  }
}
