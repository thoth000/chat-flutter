import 'package:chat_flutter/config/app_radius.dart';
import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/config/app_text_size.dart';
import 'package:chat_flutter/ui/pages/main/room/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputMessageTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roomTextController =
        Provider.of<RoomController>(context).textController;
    return Expanded(
      child: TextField(
        controller: roomTextController,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(AppRadius.midium),
          ),
          contentPadding: const EdgeInsets.all(
            AppSpace.small,
          ),
        ),
        style: TextStyle(
          fontSize: AppTextSize.midium,
        ),
      ),
    );
  }
}
