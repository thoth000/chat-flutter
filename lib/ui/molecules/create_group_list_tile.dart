import 'package:chat_flutter/config/app_space.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_text_size.dart';

class CreateGroupListTile extends StatefulWidget {
  final String name;
  final String imgUrl;

  const CreateGroupListTile({
    this.name,
    this.imgUrl,
  });

  @override
  _CreateGroupListTileState createState() => _CreateGroupListTileState();
}

class _CreateGroupListTileState extends State<CreateGroupListTile> {
  bool _isSelect = false;
  void select() {
    setState(() {
      _isSelect = !_isSelect;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: select,
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.small),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                radius: double.infinity,
                backgroundImage: NetworkImage(widget.imgUrl),
              ),
            ),
            SizedBox(
              width: AppSpace.midium,
            ),
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: AppTextSize.midium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              _isSelect ? Icons.check_box : Icons.check_box_outline_blank,
              color: _isSelect ? Colors.blue : null,
            ),
          ],
        ),
      ),
    );
  }
}
