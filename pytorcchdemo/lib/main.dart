import 'package:flutter/material.dart';
import 'package:pytorcchdemo/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pytorch Demo',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
