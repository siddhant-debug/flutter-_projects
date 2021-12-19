import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, ans = 0;
  void doAddition() {
    setState(() {
      num1 = int.parse(_first.text);
      num2 = int.parse(_second.text);
      ans = num1 + num2;
    });
  }

  void doMultiplication() {
    setState(() {
      num1 = int.parse(_first.text);
      num2 = int.parse(_second.text);
      ans = num1 * num2;
    });
  }

  void doSubtaction() {
    setState(() {
      num1 = int.parse(_first.text);
      num2 = int.parse(_second.text);
      ans = num1 - num2;
    });
  }

  void doDivision() {
    setState(() {
      num1 = int.parse(_first.text);
      num2 = int.parse(_second.text);
      ans = num1 ~/ num2;
    });
  }

  void doClear() {
    setState(() {
      _first.text = "0";
      _second.text = "0";
    });
  }

  final TextEditingController _first = new TextEditingController(text: '0');
  final TextEditingController _second = new TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'output : $ans'.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _first,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter a number 1',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _second,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter a number 2',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: doAddition,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: doSubtaction,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: Colors.teal,
              onPressed: doClear,
              child: Text('C'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: doMultiplication,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.architecture_outlined),
                  onPressed: doDivision,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
