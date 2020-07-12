import 'package:chat_flutter/ui/molecules/home/app_bar.dart';
import 'package:chat_flutter/ui/molecules/profile/app_bar.dart';
import 'package:chat_flutter/ui/molecules/talk/app_bar.dart';
import 'package:chat_flutter/ui/pages/main/home/home.dart';
import 'package:chat_flutter/ui/pages/main/main_controller.dart';
import 'package:chat_flutter/ui/pages/main/profile/profile.dart';
import 'package:chat_flutter/ui/pages/main/talk/talk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mainController = Provider.of<MainController>(context);
    final List appBarList = [
      HomePageAppBar(),
      TalkPageAppBar(),
      ProfilePageAppBar(),
    ];

    final List<Color> backgroundColor = [
      Color(0xffEEEEEE),
      Colors.white,
      Colors.white,
    ];

    final List pages = [
      HomePage(),
      TalkPage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: appBarList[_mainController.currentIndex],
      backgroundColor: backgroundColor[_mainController.currentIndex],
      bottomNavigationBar: bottomNavigation(context),
      body: pages[_mainController.currentIndex],
    );
  }

  Widget bottomNavigation(BuildContext context) {
    final _mainController = Provider.of<MainController>(context);
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _mainController.currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          title: Text(
            "",
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
          ),
          title: Text(
            "",
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          title: Text(
            "",
          ),
        ),
      ],
      onTap: (index){
        _mainController.changePage(index);
      }
    );
  }
}
