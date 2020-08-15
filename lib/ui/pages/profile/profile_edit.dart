import 'package:chat_flutter/services/auth/authenticator.dart';
import 'package:chat_flutter/ui/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_flutter/ui/atoms/profile_image.dart';
import 'package:chat_flutter/ui/molecules/profile/app_bar.dart';

import 'package:chat_flutter/model/user.dart';

import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/config/app_text_size.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage._({Key key}) : super(key: key);

  static Widget wrapped(BuildContext context) {
    return ChangeNotifierProvider<ProfileController>(
      create: (_) =>
          ProfileController(Provider.of<Authenticator>(context, listen: false)),
      child: const ProfileEditPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileController>(context).user;
    return Scaffold(
      appBar: ProfilePageAppBar(),
      backgroundColor: Colors.white,
      body: (user.name == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _ProfileEditPage(
              user: user,
            ),
    );
  }
}

class _ProfileEditPage extends StatelessWidget {
  final User user;

  const _ProfileEditPage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profileController =
        Provider.of<ProfileController>(context, listen: false);
    final TextEditingController _nameController = TextEditingController(
      text: ModalRoute.of(context).settings.arguments.toString(),
    );
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const ImageButton(),
          const SizedBox(
            height: AppSpace.small,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.midium,
            ),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 1,
              controller: _nameController,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppTextSize.xlarge,
                fontWeight: FontWeight.w700,
              ),
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
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                label: const Text('更新する'),
                onPressed: () async {
                  await profileController
                      .changeProfileInfo(_nameController.text);
                  Navigator.of(context).pop();
                },
                color: Colors.redAccent,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({Key key, this.image, this.size}) : super(key: key);
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<ProfileController>(context);
    if (profileController.image != null) {
      return SizedBox(
        width: size,
        height: size,
        child: FlatButton(
          onPressed: profileController.selectProfileImage,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.file(
            profileController.image,
          ),
        ),
      );
    } else if (profileController.user.imgUrl != null) {
      print(profileController.user.imgUrl+'image');
      return SizedBox(
        width: size,
        height: size,
        child: FlatButton(
          onPressed: profileController.selectProfileImage,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.network(
            profileController.user.imgUrl,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: size,
        height: size,
        child: FlatButton(
          onPressed: profileController.selectProfileImage,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(
            'assets/images/avatar.JPG',
          ),
        ),
      );
    }
  }
}
