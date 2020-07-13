import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpController with ChangeNotifier {
  SignUpController(this.authenticator) {
    authenticator.firebaseUser.listen((user) {
      _firebaseUser = user;
    });
    nameTextController.addListener(() {
      _name = nameTextController.text;
    });
    emailTextController.addListener(() {
      _email = emailTextController.text;
    });
    passwordTextController.addListener(() {
      _password = passwordTextController.text;
    });
  }

  final Authenticator authenticator;
  FirebaseUser _firebaseUser;

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String _name;
  String _email;
  String _password;

//  String get name => _name;
//  String get email => _email;
//  String get password => _password;

  Future<void> signUp() async {
    await authenticator.signUp(_email, _password);
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
