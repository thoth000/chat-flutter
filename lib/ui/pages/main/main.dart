import 'package:chat_flutter/ui/molecules/home/app_bar.dart';
import 'package:chat_flutter/ui/molecules/profile/app_bar.dart';
import 'package:chat_flutter/ui/molecules/talk/app_bar.dart';
import 'package:chat_flutter/ui/pages/main/home/home.dart';
import 'package:chat_flutter/ui/pages/main/home/home_controller.dart';
import 'package:chat_flutter/ui/pages/main/main_controller.dart';
import 'package:chat_flutter/ui/pages/main/profile/profile.dart';
import 'package:chat_flutter/ui/pages/main/profile/profile_controller.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainController>(
          create: (_) => MainController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider<TalkController>(
          create: (_) => TalkController(),
        ),
        ChangeNotifierProvider<ProfileController>(
          create: (_) => ProfileController(),
        ),
      ],
      child: MainPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    final List<PreferredSizeWidget> appBarList = [
      HomePageAppBar(),
      TalkPageAppBar(),
      ProfilePageAppBar(),
    ];

    final List<Color> backgroundColor = [
      const Color(0xffEEEEEE),
      Colors.white,
      Colors.white,
    ];

    final List<StatelessWidget> pages = [
      HomePage(),
      TalkPage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: appBarList[controller.currentIndex],
      backgroundColor: backgroundColor[controller.currentIndex],
      bottomNavigationBar: _bottomNavigation(context),
      body: pages[controller.currentIndex],
    );
  }

  Widget _bottomNavigation(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text(
            '',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
          ),
          title: Text(
            '',
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          title: Text(
            '',
          ),
        ),
      ],
      onTap: controller.changePage,
    );
  }
}
