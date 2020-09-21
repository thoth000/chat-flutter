import 'package:chat_flutter/ui/pages/create_room/create_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomImage extends StatelessWidget {
  const RoomImage({Key key, this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CreateRoomController>(context);
    if (controller.selectedImageFile != null) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundImage: FileImage(controller.selectedImageFile),
        ),
      );
    } else if (controller.room.imgUrl != '' && controller.room.imgUrl != null) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(controller.room.imgUrl),
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
