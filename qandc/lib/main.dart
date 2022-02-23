import 'package:flutter/material.dart';
import 'package:qandc/Classical.dart';
import 'package:qandc/quantum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quantum and Classical Models"),
        ),
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/back.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.red,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuantumPage(),
                            ),
                          );
                        },
                        child: const Text("Quantum model"),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.red,
                                width: 4,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          elevation: MaterialStateProperty.all(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClassicalPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Classical model",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
