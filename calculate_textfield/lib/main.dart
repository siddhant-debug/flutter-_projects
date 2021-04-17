import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TextEditingController controller1 = TextEditingController();
  // TextEditingController controller2 = TextEditingController();
  String a;
  String b;
  String sum(a, b) {
    String result = a + b;
    return result;
  }
  // @override
  // void initState() {
  //   super.initState();
  //   controller1 = TextEditingController();
  //   controller2 = TextEditingController();
  // }
  //
  // @override
  // void dispose() {
  //   controller1.dispose();
  //   controller2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('sum'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Row(
                children: [
                  Text(
                    'A:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: 'enter value of A'),
                        onSubmitted: (value) {
                          a = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'B:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onSubmitted: (value) {
                          b = value;
                        },
                        decoration:
                            InputDecoration(hintText: 'enter value of B'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              color: Colors.deepPurple,
              onPressed: () {
                setState(() {
                  sum(a, b);
                });
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
