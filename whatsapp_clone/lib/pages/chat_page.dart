import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widgets/chat_tile.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () {},
      ),
      body: ListView(
        children: [
          ChatTile(),
          ChatTile(),
          ChatTile(),
        ],
      ),
    );
  }
}
