import 'package:chat_flutter/ui/molecules/talk/list_tile.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roomList = Provider.of<TalkController>(context).roomList;
    if (roomList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: roomList.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return TalkPageListTile(roomList[index]);
        },
      );
    }
  }
}
