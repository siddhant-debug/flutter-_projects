import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Expansiontile(),
    );
  }
}

class Expansiontile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expansion Tile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                ExpansionTile(
                  title: Text(
                    "Title",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 20,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(5, 5)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                'All',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Text('EHLO'),
            ),
          ],
        ),
      ),
    );
  }
}
