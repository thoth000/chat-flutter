import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/config/app_text_size.dart';
import 'package:chat_flutter/ui/atoms/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/room.dart';

class TalkPageListTile extends StatelessWidget {
  final Future<Room> room;

  const TalkPageListTile(this.room);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: room,
      builder: (BuildContext context, AsyncSnapshot<Room> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        return FlatButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/roomPage',
              arguments: snapshot.data,
            );
          },
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.small),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularImage(size: 60, imgUrl: snapshot.data.imgUrl),
                  const SizedBox(
                    width: AppSpace.midium,
                  ),
                  SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 135,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                snapshot.data.name,
                                style: const TextStyle(
                                  fontSize: AppTextSize.midium,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              snapshot.data.sendTime,
                              style: const TextStyle(
                                fontSize: AppTextSize.xsmall,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text(
                            snapshot.data.lastMessage,
                            style: const TextStyle(
                              fontSize: AppTextSize.small,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
