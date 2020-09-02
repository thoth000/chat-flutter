import 'package:chat_flutter/model/room.dart';
import 'package:chat_flutter/ui/molecules/talk/list_tile.dart';
import 'package:chat_flutter/ui/pages/talk/talk_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<TalkController>(context).getStreamSnapshot(),
      builder: (BuildContext context, AsyncSnapshot<List<Future<Room>>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return TalkPageListTile(snapshot.data[index]);
            },
          );
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
