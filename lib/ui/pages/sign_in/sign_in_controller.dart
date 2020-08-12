import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:flutter/cupertino.dart';

class SignInController with ChangeNotifier {
  SignInController(this.authenticator) {
    emailTextController.addListener(() {
      _email = emailTextController.text;
    });
    passwordTextController.addListener(() {
      _password = passwordTextController.text;
    });
  }

  final Authenticator authenticator;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  String _email;
  String _password;

  String get email => _email;
  String get password => _password;

  Future<void> signIn() async {
    await authenticator.signIn(_email, _password);
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
