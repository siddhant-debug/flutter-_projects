import 'package:flutter/material.dart';
import 'dart:math';

import 'package:myfitnessfreak/bmi.dart';
import 'package:myfitnessfreak/calcount.dart';
import 'package:myfitnessfreak/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.notes),
                ),
                Tab(
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  icon: Icon(Icons.directions_transit),
                ),
                Tab(
                  icon: Icon(Icons.directions_bike),
                ),
              ],
            ),
            title: Text(
              'MyFitnessFreak',
            ),
          ),
          body: TabBarView(
            children: [
              Home(),
              Bmi(),
              CalCount(),
              Center(child: Text('Hi')),
            ],
          ),
        ),
      ),
    );
  }
}
