import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/molecules/create_room_list_tile.dart';
import 'package:chat_flutter/ui/pages/create_room/create_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectMemberPage extends StatelessWidget {
  const SelectMemberPage._({Key key}) : super(key: key);
  static Widget wrapped() {
    return ChangeNotifierProvider<CreateRoomController>(
      create: (_) => CreateRoomController(),
      child: const SelectMemberPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<CreateRoomController>(context, listen: false);
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
        ),
        title: const Text(
          'メンバーを選択',
          style: TextStyle(color: Color(0xff707070)),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('次へ'),
            onPressed: () => Navigator.pushNamed(context, '/createGroupPage'),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter a message',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    controller.searchUser('id');
                  },
                ),
              ),
            ),
          ),
          Expanded(child: SearchedUserList()),
          MemberList(),
        ],
      ),
    );
  }
}

class SearchedUserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<CreateRoomController>(context, listen: false);
    final userList = Provider.of<CreateRoomController>(context).searchedUser;
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return CreateRoomListTile(
          user: userList[index],
          onPressed: controller.addMember(userList[index]),
        );
      },
    );
  }
}

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<CreateRoomController>(context).members;
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 40,
            margin: EdgeInsets.all(AppSpace.small),
            child: FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.blue,
              child: Text(
                userList[index].name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
