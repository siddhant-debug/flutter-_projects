import 'dart:math';

import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({
    Key key,
  }) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  num height = 0, weight = 0, result = 0;
  final TextEditingController t1 = new TextEditingController(text: '0');
  final TextEditingController t2 = new TextEditingController(text: '0');
  void calBmi() {
    setState(() {
      height = int.parse(t1.text);
      weight = int.parse(t2.text);
      result = weight / pow(height / 100, 2);
      return result.toStringAsFixed(2);
    });
  }

  String getRes() {
    if (result >= 25) {
      return 'OverWeight';
    } else if (result > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpret() {
    if (result >= 25) {
      return 'Try to Eat Less than your daily required calories ';
    } else if (result > 25) {
      return 'Your are doing fine change according to your requirement';
    } else {
      return 'Try to Eat More !! ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFF111328),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t1,
                decoration: InputDecoration(
                  labelText: 'Enter Height',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: t2,
                decoration: InputDecoration(
                  labelText: 'Enter Weight',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: calBmi,
              child: Text(
                'Calculate Bmi',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: 396,
              width: 420,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Output: $result'.toUpperCase(),
                    style:
                        TextStyle(color: Colors.green.shade600, fontSize: 25),
                  ),
                  Text(
                    getRes(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                  Text(
                    getInterpret(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
