import 'package:chat_flutter/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserService {
  final Firestore _db = Firestore.instance;
  Future<void> setUserData(String name, String uid) async {
    final userData = {
      'name': name,
      'profileImageURL': '',
    };
    await _db.collection('message/v1/users').document('$uid').setData(userData);
  }

  Future<User> getUserData(String uid) {
    final result = _db.collection('message/v1/users').document('$uid').get();
    return result.then((value) => User.fromJson(value.data));
  }
}
