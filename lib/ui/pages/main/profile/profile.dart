import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/ui/atoms/profile_image.dart';
import 'package:chat_flutter/ui/pages/main/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter/model/user.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileController>(context).user;
    if (user == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return _ProfilePage(user: user);
    }
  }
}

class _ProfilePage extends StatelessWidget {
  final User user;

  const _ProfilePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ProfileImage(
            image: user.imgUrl,
            size: 150,
          ),
          SizedBox(
            height: AppSpace.small,
          ),
          Text(
            user.name,
            style: TextStyle(
              fontSize: AppTextSize.xlarge,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: AppSpace.large,
          ),
          Center(
            child: Container(
              width: 150,
              child: RaisedButton.icon(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                label: const Text('編集する'),
                onPressed: () {
                  Navigator.pushNamed<void>(
                    context,
                    '/profileEditPage',
                    arguments: user.name,
                  );
                },
                color: Colors.green,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
