import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
              onSelected: (value) => print(value),
              itemBuilder: (BuildContext ctx) => [
                    PopupMenuItem(
                      child: Text('New Group'),
                      value: 'New Group',
                    ),
                    PopupMenuItem(
                      child: Text('New Broadcast'),
                      value: 'New Broadcast',
                    ),
                    PopupMenuItem(
                      child: Text('Whatsapp Web'),
                      value: 'Whatsapp Web',
                    ),
                    PopupMenuItem(
                      child: Text('Starred Messages'),
                      value: 'Starred Messages',
                    ),
                    PopupMenuItem(
                      child: Text('Settings'),
                      value: 'Settings',
                    ),
                  ]),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text('CAMERA'),
          ChatPage(),
          Text('STATUS'),
          Text('CALLS'),
        ],
      ),
    );
  }
}
