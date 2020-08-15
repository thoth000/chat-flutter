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
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff707070),
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color(0xff707070),
        ),
      ),
      backgroundColor: Colors.white,
      body: (user == null)
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
    final TextEditingController nameController = TextEditingController(
      text: ModalRoute.of(context).settings.arguments.toString(),
    );
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const ImageButton(
            size: 150,
          ),
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
              controller: nameController,
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
                  print(nameController.text);
                  await profileController
                      .changeProfileInfo(nameController.text);
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
  const ImageButton({Key key, this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<ProfileController>(context);
    return FlatButton(
      onPressed: profileController.selectProfileImage,
      child: child(profileController),
    );
  }

  Widget child(ProfileController profileController) {
    if (profileController.image != null) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundImage: FileImage(profileController.image),
        ),
      );
    } else if (profileController.user.imgUrl != '') {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(profileController.user.imgUrl),
          ),
        ),
      );
    } else {
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/avatar.JPG'),
          ),
        ),
      );
    }
  }
}
