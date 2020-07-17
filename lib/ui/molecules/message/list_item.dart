import 'package:chat_flutter/config/app_radius.dart';
import 'package:chat_flutter/config/app_space.dart';
import 'package:chat_flutter/model/message.dart';
import 'package:chat_flutter/ui/atoms/profile_image.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class MessageListItem extends StatelessWidget {
  MessageListItem(this.message);
  final Message message;
  @override
  Widget build(BuildContext context) {
    //isMeは頻繁に使うし変化しないから、ここで定義するのは？
    //あとmessage.messageに少し違和感 => message.textとか？
    return Padding(
      padding: EdgeInsets.all(AppSpace.xsmall),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          if (message.isMe)
            Column(
              children: <Widget>[
                Text(
                  (message.isRead) ? '既読' : '',
                  style: TextStyle(
                    fontSize: AppTextSize.xsmall,
                  ),
                ),
                Text(
                  message.sendTime,
                  style: TextStyle(
                    fontSize: AppTextSize.xsmall,
                  ),
                ),
              ],
            ),
          if (!message.isMe)
            const ProfileImage(
              image: null,
              size: 40,
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 2,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: AppSpace.xsmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.small),
              color: message.isMe ? Colors.blue : const Color(0xffEEEEEE),
            ),
            padding: const EdgeInsets.all(AppSpace.small),
            child: Text(
              message.message,
              softWrap: true,
              style: TextStyle(
                fontSize: AppTextSize.midium,
                color: message.isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
          if (!message.isMe)
            Text(
              message.sendTime,
              style: TextStyle(
                fontSize: AppTextSize.xsmall,
              ),
            ),
        ],
      ),
    );
  }
}
