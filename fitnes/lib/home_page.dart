import 'package:fitnes/BottomNaviPage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF111328),
          title: 'Workout'.text.make(),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration:
                        InputDecoration.collapsed(hintText: 'ex:Exercises'),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNaviPage(),
      ),
    );
  }
}
