import 'package:chat_flutter/ui/pages/room.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/model/room.dart';

import 'package:chat_flutter/config/app_color.dart';

class TalkPageListTile extends StatelessWidget {
  final Room room;
  TalkPageListTile(this.room);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomPage(room.name),
          ),
        );
      },
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  radius: double.infinity,
                  backgroundImage: NetworkImage(room.imgUrl),
                ),
              ),
              SizedBox(
                width: 20,
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
                            room.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          room.sendTime,
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColor.baseColor,
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        room.lastMessage,
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColor.baseColor,
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
  }
}
