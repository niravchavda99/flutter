import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatTile extends StatefulWidget {
  ChatTile({Key key}) : super(key: key);

  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            child: SvgPicture.asset('assets/svg/groups.svg'),
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          ),
          title: Text(
            'Milind Modi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.done_all),
              SizedBox(width: 5),
              Text(
                'Hi, Where are you?',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          trailing: Text('19:56'),
        ),
        Divider(),
      ],
    );
  }
}
