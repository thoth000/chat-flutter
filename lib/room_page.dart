import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'message_list.dart';

class RoomPage extends StatefulWidget {
  final String name;
  RoomPage(this.name);
  //本来はfirebase上のIDを渡して、ルーム名を取得したい。
  @override
  _RoomPageState createState() => _RoomPageState(this.name);
}

class _RoomPageState extends State<RoomPage> {
  final String name;
  _RoomPageState(this.name);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff707070),
        ),
        title: Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xff707070),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          MessageList(),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  _controller.clear();
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
