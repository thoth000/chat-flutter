import 'package:flutter/material.dart';

import 'package:chat_flutter/ui/pages/add_friend.dart';
import 'package:chat_flutter/ui/pages/create_group.dart';
import 'package:chat_flutter/ui/pages/main/main.dart';
import 'package:chat_flutter/ui/pages/main/profile/profile_edit.dart';
import 'package:chat_flutter/ui/pages/room.dart';
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
      initialRoute: '/mainPage',
      routes: {
        '/mainPage': (context) => MainPage.wrapped(),
        '/signUpPage': (context) => SignUpPage(),
        '/signInPage': (context) => SignInPage(),
        '/roomPage': (context) => RoomPage(),
        '/profileEditPage': (context) => ProfileEditPage.wrapped(),
        '/addFriendPage': (context) => AddFriendPage(),
        '/createGroupPage': (context) => CreateGroupPage(),
      },
    );
  }
}
