import 'package:chat_flutter/interfaces/user.dart';
import 'package:chat_flutter/model/user.dart';

class UserService implements UserInterface {
  UserService();

  @override
  Future<User> getUserById(String userId) async {
    final User user = User(name: 'test', imgUrl: '');

    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return Future.value(user);
  }
}
