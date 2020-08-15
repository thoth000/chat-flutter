import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/services/firebase_user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpController with ChangeNotifier {
  SignUpController(this.authenticator) {
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
  final FirebaseUserService firebaseUserService = FirebaseUserService();

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  String _name;
  String _email;
  String _password;

  String get name => _name;
  String get email => _email;
  String get password => _password;

  Future<void> signUp() async {
    final FirebaseUser user = await authenticator.signUp(_email, _password);
    if(user!=null){
      await firebaseUserService.setUserData(name, user.uid);
    }
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
