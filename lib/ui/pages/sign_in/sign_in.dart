import 'package:chat_flutter/config/app_radius.dart';
import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/ui/atoms/input_text_field.dart';
import 'package:chat_flutter/ui/pages/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage._();

  static Widget wrapped(Authenticator authenticator) {
    return ChangeNotifierProvider<SignInController>(
      create: (_) => SignInController(authenticator),
      child: const SignInPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignInController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: AppSpace.midium,
              top: AppSpace.big,
            ),
            child: Text(
              'SIGN IN',
              style: TextStyle(
                fontSize: AppTextSize.big,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: AppSpace.big,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: AppSpace.midium,
                top: AppSpace.xlarge,
                right: AppSpace.midium,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppRadius.large),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      InputTextField(
                        hintText: 'email',
                        keyboardType: TextInputType.text,
                        controller: controller.emailTextController,
                      ),
                      InputTextField(
                        hintText: 'password',
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: controller.passwordTextController,
                      ),
                      SizedBox(
                        height: AppSpace.big,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSpace.large,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpace.big,
                      vertical: AppSpace.small,
                    ),
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: AppTextSize.xlarge,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    color: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(AppRadius.xlarge),
                    ),
                    onPressed: () async {
                      await controller.signIn();
                      await Navigator.pushNamed(context, '/homePage');
                    },
                  ),
                  SizedBox(
                    height: AppSpace.large,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUpPage');
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: AppTextSize.large,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
