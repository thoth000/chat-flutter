import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpController with ChangeNotifier {
  SignUpController(this.authenticator){
    authenticator.firebaseUser.listen((user) {
      _firebaseUser = user;
    });
  }

  final Authenticator authenticator;
  FirebaseUser _firebaseUser;

  String _email;
  String get email => _email;

  String _password;
  String get password => _password;

}