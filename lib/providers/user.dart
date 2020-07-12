import 'package:chat_flutter/services/user.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/model/user.dart';

class UserProvider with ChangeNotifier {
  UserProvider() {
    _initialize();
  }

  UserService _userService;

  void _initialize() {
    _userService = UserService();
  }

  Future<User> getUserById(String userId) {
    return _userService.getUserById(userId);
  }
}
