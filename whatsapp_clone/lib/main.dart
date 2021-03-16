import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff128C7E),
        fontFamily: 'OpenSans',
      ),
      home: HomeScreen(),
    );
  }
}
