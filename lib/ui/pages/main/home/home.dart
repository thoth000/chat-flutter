import 'package:flutter/material.dart';


import 'package:chat_flutter/config/app_space.dart';

import 'package:chat_flutter/ui/molecules/home/my_tile.dart';
import 'package:chat_flutter/ui/molecules/home/friend_tile_list.dart';
import 'package:chat_flutter/ui/molecules/home/group_tile_list.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyTile(),
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 180,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: AppSpace.midium,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSpace.midium,
                  ),
                  child: Text(
                    'Groups',
                    style: TextStyle(
                      fontSize: AppTextSize.small,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GroupTileList(),
                Divider(
                  endIndent: AppSpace.big,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppSpace.midium,
                  ),
                  child: Text(
                    'Friends',
                    style: TextStyle(
                      fontSize: AppTextSize.small,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FriendTileList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
