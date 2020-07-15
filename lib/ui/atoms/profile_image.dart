import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  final double size;

  const ProfileImage({Key key, this.image,this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/avatar.JPG",
          ),
        ),
      ),
    );
  }
}
