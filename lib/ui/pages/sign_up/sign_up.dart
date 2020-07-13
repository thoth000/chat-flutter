import 'package:chat_flutter/config/app_radius.dart';
import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/atoms/input_text_field.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: AppSpace.midium,
              top: AppSpace.big,
            ),
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: AppTextSize.big,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: AppSpace.big,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
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
                        hintText: 'name',
                        keyboardType: TextInputType.text,
                        controller: nameTextController,
                      ),
                      InputTextField(
                        hintText: 'email',
                        keyboardType: TextInputType.text,
                        controller: emailTextController,
                      ),
                      InputTextField(
                        hintText: 'password',
                        keyboardType: TextInputType.text,
                        controller: passwordTextController,
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
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: AppSpace.large,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/signInPage',
                      );
                    },
                    child: const Text(
                      'SIGN IN',
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
