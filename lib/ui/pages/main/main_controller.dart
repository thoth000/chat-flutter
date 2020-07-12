import 'package:flutter/material.dart';

class MainController with ChangeNotifier{
  int currentIndex;
  MainController(){
    currentIndex = 0;
  }

  void changePage(int index){
    currentIndex = index;
    notifyListeners();
  }
}