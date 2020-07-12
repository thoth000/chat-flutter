import 'package:chat_flutter/ui/molecules/talk/list_tile.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk_controller.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/room.dart';
import 'package:provider/provider.dart';

class TalkPage extends StatefulWidget {
  @override
  _TalkPageState createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  @override
  Widget build(BuildContext context) {
    final _talkController = Provider.of<TalkController>(context);
    return FutureBuilder(
      future: _talkController.getRoomList(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Room>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data.length != 0) {
            return ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return TalkPageListTile(snapshot.data[index]);
                });
          } else {
            return Center(
              child: Text("トークルームがありません"),
            );
          }
        } else if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
