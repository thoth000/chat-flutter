import 'package:chat_flutter/ui/molecules/create_room/create_room_list_tile.dart';
import 'package:chat_flutter/ui/pages/create_room/create_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomMemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<CreateRoomController>(context).members;
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return CreateRoomListTile(
          user: userList[index],
        );
      },
    );
  }
}
