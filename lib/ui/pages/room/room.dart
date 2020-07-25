import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/molecules/message/list.dart';
import 'package:chat_flutter/ui/molecules/room/input_message_text_field.dart';
import 'package:chat_flutter/ui/pages/room/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class RoomPage extends StatelessWidget {
  const RoomPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return ChangeNotifierProvider<RoomController>(
      create: (_) => new RoomController(),
      child: const RoomPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context).settings.arguments.toString();
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
          name,
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
      body: Column(
        children: <Widget>[
          MessageList(),
          SizedBox(
            height: AppSpace.xsmall,
          ),
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
                  await roomController.sendMessage(textController.text);
                  textController.clear();
                },
                icon: Icon(
                  Icons.send,
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSpace.xsmall,
          ),
        ],
      ),
    );
  }
}
