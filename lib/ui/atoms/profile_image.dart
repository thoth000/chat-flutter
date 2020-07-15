import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key, this.image, this.size}) : super(key: key);
  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/avatar.JPG',
          ),
        ),
      ),
    );
  }
}
