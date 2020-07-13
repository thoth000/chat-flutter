import 'package:chat_flutter/providers/user.dart';
import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';
import 'package:chat_flutter/ui/pages/main/main_controller.dart';
import 'package:chat_flutter/ui/pages/main/profile/profile_controller.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return <SingleChildWidget>[
    ChangeNotifierProvider<UserProvider>(
      create: (_) => UserProvider(),
    ),
    ChangeNotifierProvider<MainController>(
      create: (_) => MainController(),
    ),
    ChangeNotifierProvider<TalkController>(
      create: (_) => TalkController(),
    ),
    ChangeNotifierProvider<ProfileController>(
      create: (_) => ProfileController(),
    ),
  ];
}
