import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petui/descprionscreen.dart';
import 'package:petui/drawerscreen.dart';
import 'package:petui/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
