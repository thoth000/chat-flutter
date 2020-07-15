import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter/config/app_space.dart';

import 'package:chat_flutter/ui/molecules/home/list_tile.dart';

import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';

class GroupTileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groupList = Provider.of<HomeController>(context).groupList;
    if (groupList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 220,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: AppSpace.small,
            ),
            ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: groupList.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return HomePageListTile(
                  name: groupList[index].name,
                  imgUrl: groupList[index].imgUrl,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
