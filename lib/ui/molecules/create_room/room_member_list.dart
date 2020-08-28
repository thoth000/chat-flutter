import 'package:chat_flutter/model/user.dart';
import 'package:chat_flutter/ui/molecules/create_room/create_room_list_tile.dart';
import 'package:flutter/material.dart';

class RoomMemberList extends StatelessWidget {
  const RoomMemberList({this.members});
  final List<User> members;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (BuildContext context, int index) {
        return CreateRoomListTile(
          user: members[index],
        );
      },
    );
  }
}
