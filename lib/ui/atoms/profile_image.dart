import 'package:chat_flutter/ui/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key, this.image, this.size}) : super(key: key);
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    final profileController = Provider.of<ProfileController>(context);
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
