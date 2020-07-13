import 'package:chat_flutter/ui/molecules/talk/list_tile.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkPage extends StatelessWidget {
  TalkPage({Key key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    final _roomList = Provider.of<TalkController>(context).roomList;
    if (_roomList == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _roomList.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return TalkPageListTile(_roomList[index]);
        },
      );
    }
  }
}
