import 'package:fitnes/BottomNaviPage.dart';
import 'package:flutter/material.dart';
import 'package:fitnes/track_food.dart';

class BmiCal extends StatefulWidget {
  @override
  _BmiCalState createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  int height;
  int weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Bmi'),
        backgroundColor: Color(0xFF111328),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ReusableCard(
              label: 'Weight :',
              hint: 'Enter Weight',
            ),
            ReusableCard(
              label: 'Height :',
              hint: 'Enter Height',
            ),
            MyButton()
          ],
        ),
      ),
      bottomNavigationBar: BottomNaviPage(),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFFEB1555),
      onPressed: onTap,
      child: Icon(
        Icons.done,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
    );
  }
}
