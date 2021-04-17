import 'package:fitnes/home_page.dart';
import 'package:fitnes/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Fitness!!'),
            backgroundColor: Color(0xFF111328),
          ),
          body: LoginPage(),
        ),
      ),
    );
  }
}
