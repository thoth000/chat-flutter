import 'package:chat_flutter/ui/pages/create_room/select_member.dart';
import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/ui/pages/create_room/create_room.dart';
import 'package:chat_flutter/ui/pages/home/home.dart';
import 'package:chat_flutter/ui/pages/profile/profile_edit.dart';
import 'package:chat_flutter/ui/pages/room/room.dart';
import 'package:chat_flutter/ui/pages/sign_in.dart';
import 'package:chat_flutter/ui/pages/sign_up/sign_up.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<Authenticator>(
        create: (_) => Authenticator(),
        dispose: (_, authenticator) => authenticator.dispose(),
      ),
    ],
    child: MyApp(),
  ));
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
      initialRoute: Provider.of<Authenticator>(context, listen: false).isSignIn.value ? '/homePage' : '/signUpPage',
      routes: {
        '/homePage': HomePage.wrapped,
        '/signUpPage': (context) => SignUpPage.wrapped(Provider.of<Authenticator>(context, listen: false)),
        '/signInPage': (context) => SignInPage(),
        '/roomPage': (context) => RoomPage.wrapped(),
        '/profileEditPage': ProfileEditPage.wrapped,
        '/selectMemberPage': (context) => SelectMemberPage.wrapped(),
        '/createGroupPage': (context) => CreateRoomPage.wrapped(),
      },
    );
  }
}
