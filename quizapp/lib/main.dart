import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var questions = [
    "What's your number ? \n ",
    "What's your favourite color ? \n",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("$questions"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Answer 1"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Answer 2"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Answer 3"),
          ),
          const Text(
            "THIS YEAR IS MINE ",
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
