import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/model/room.dart';
import 'package:chat_flutter/ui/molecules/message/list.dart';
import 'package:chat_flutter/ui/molecules/room/input_message_text_field.dart';
import 'package:chat_flutter/ui/pages/room/room_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class RoomPage extends StatelessWidget {
  const RoomPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider<RoomController>(
      create: (_) => RoomController(),
      child: const RoomPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Room room = ModalRoute.of(context).settings.arguments as Room;
    final roomController = Provider.of<RoomController>(context, listen: false);
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
        ),
        title: Text(
          room.name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xff707070),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('message/v1/rooms/${room.id}/transcripts')
                      .snapshots(),
                  builder: (context, snapshot) {
                    roomController.getMessageList();
                    return MessageList();
                  }),
              const SizedBox(
                height: AppSpace.xBig,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(
                      width: AppSpace.small,
                    ),
                    InputMessageTextField(
                      roomTextController: textController,
                    ),
                    SizedBox(
                      width: AppSpace.xsmall,
                    ),
                    IconButton(
                      onPressed: () async {
                        await roomController.sendMessage(
                            textController.text, 'roomId');
                        textController.clear();
                      },
                      icon: Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSpace.midium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
