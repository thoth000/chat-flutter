import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  int currentIndex;
  HomeController() {
    currentIndex = 0;
  }

  void changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
