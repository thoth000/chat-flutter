import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserService{
  final Firestore _db = Firestore.instance;
  Future<void> setUserData(String name,String uid) async {
    final userData = {
      'name': name,
      'profileImageURL': '',
    };
    await _db
        .collection('message/v1/users')
        .document('$uid')
        .setData(userData);
  }
}