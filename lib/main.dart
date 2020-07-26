import 'package:flutter/material.dart';

import 'package:chat_flutter/ui/pages/add_friend.dart';
import 'package:chat_flutter/ui/pages/create_group.dart';
import 'package:chat_flutter/ui/pages/home/home.dart';
import 'package:chat_flutter/ui/pages/profile/profile_edit.dart';
import 'package:chat_flutter/ui/pages/room/room.dart';
import 'package:chat_flutter/ui/pages/sign_in.dart';
import 'package:chat_flutter/ui/pages/sign_up.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => HomePage.wrapped(),
        '/signUpPage': (context) => SignUpPage(),
        '/signInPage': (context) => SignInPage(),
        '/roomPage': (context) => RoomPage.wrapped(),
        '/profileEditPage': (context) => ProfileEditPage.wrapped(),
        '/addFriendPage': (context) => AddFriendPage(),
        '/createGroupPage': (context) => CreateGroupPage(),
      },
    );
  }
}
