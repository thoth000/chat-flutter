import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/molecules/create_group_list_tile.dart';
import 'package:chat_flutter/ui/pages/create_room/create_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/user.dart';

import 'package:chat_flutter/config/app_text_size.dart';
import 'package:provider/provider.dart';

class CreateRoomPage extends StatelessWidget {
  const CreateRoomPage._({Key key}) : super(key: key);
  static Widget wrapped() {
    return ChangeNotifierProvider<CreateRoomController>(
      create: (_) => CreateRoomController(),
      child: const CreateRoomPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Group',
          style: TextStyle(
            color: Color(0xff707070),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //room作成
              Navigator.pushReplacementNamed(context, '/homePage');
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: AppSpace.midium,
          ),
          FlatButton(
            onPressed: () {},
            child: const SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                radius: double.infinity,
                backgroundImage: const NetworkImage(
                    'https://wired.jp/app/uploads/2019/10/dog-unsolicited.jpg'),
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: _textEditingController,
              style: TextStyle(
                fontSize: AppTextSize.xlarge,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: AppSpace.big,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSpace.midium,
              ),
              child: Text(
                'members',
                style: TextStyle(
                  fontSize: AppTextSize.small,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: MemberList(),
          ),
        ],
      ),
    );
  }
}

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<CreateRoomController>(context).members;
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (BuildContext context, int index) {
        return CreateGroupListTile(
          user: userList[index],
          onPressed: null,
        );
      },
    );
  }
}
