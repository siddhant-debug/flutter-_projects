import 'package:flutter/material.dart';
import 'package:dicee/DicePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
          appBar: AppBar(
            backgroundColor: Colors.orange.shade700,
            leading: Icon(Icons.android),
            actions: [
              Icon(Icons.search),
            ],
            title: Text('Dicee'),
          ),
          body: DicePage(),
        ),
      ),
    );
  }
}
