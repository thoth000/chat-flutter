import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter/ui/molecules/home/list_tile.dart';

import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';

class MyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<HomeController>(context).user;
    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return HomePageListTile(
      name: user.name,
      imgUrl: user.imgUrl,
      isMe: true,
    );
  }
}