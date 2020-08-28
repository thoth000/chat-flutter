import 'package:chat_flutter/ui/molecules/create_room/create_room_list_tile.dart';
import 'package:chat_flutter/ui/pages/create_room/select_member_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedUserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SelectMemberController>(context);
    return ListView.builder(
      itemCount: controller.searchedUserList.length,
      itemBuilder: (BuildContext context, int index) {
        return FlatButton(
          onPressed: () {
            controller.addMember(controller.searchedUserList[index]);
          },
          child: CreateRoomListTile(
            user: controller.searchedUserList[index],
          ),
        );
      },
    );
  }
}
