import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int dice1 = 5;

  int dice2 = 5;

  void diceRotate() {
    dice1 = Random().nextInt(6) + 1;
    dice2 = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.cyan, Colors.indigo, Colors.purpleAccent],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              fillColor: Colors.indigo,
              elevation: 6.0,
              constraints: BoxConstraints.tightFor(
                width: 80.0,
                height: 80.0,
              ),
              shape: CircleBorder(),
              onPressed: () {
                setState(() {
                  diceRotate();
                });
              },
              child: Text(
                'PRESS ME',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              height: 20.0,
              thickness: 20.0,
              color: Colors.black38,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(190.0),
                            ),
                          )),
                      onPressed: () {
                        setState(() {
                          diceRotate();
                        });
                      },
                      child: Image(
                        image: AssetImage('images/dice$dice1.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(190.0),
                            ),
                          )),
                      onPressed: () {
                        setState(() {
                          diceRotate();
                        });
                      },
                      child: Image(
                        image: AssetImage('images/dice$dice2.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20.0,
              thickness: 20.0,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
