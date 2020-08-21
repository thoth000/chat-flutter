import 'package:chat_flutter/ui/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key, this.size, this.profileController})
      : super(key: key);
  final double size;
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    if (profileController.image != null) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundImage: FileImage(profileController.image),
        ),
      );
    } else if (profileController.user.imgUrl != '' &&
        profileController.user.imgUrl != null) {
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
