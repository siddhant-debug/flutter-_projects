import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          title: Text("I am Poor"),
          backgroundColor: Colors.black54,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/COAL.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
