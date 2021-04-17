import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  void play(int soundNum) {
    final player = AudioCache();
    player.play('note$soundNum.wav');
  }

  Expanded buildkey({Color color, int soundNum}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        onPressed: () {
          play(soundNum);
        },
        child: Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 8,
              title: Text(
                "Xylophone",
              ),
              backgroundColor: Colors.indigo,
            ),
            body: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildkey(color: Colors.red, soundNum: 1),
                  buildkey(color: Colors.orange, soundNum: 2),
                  buildkey(color: Colors.yellow, soundNum: 3),
                  buildkey(color: Colors.green, soundNum: 4),
                  buildkey(color: Colors.teal, soundNum: 5),
                  buildkey(color: Colors.blue, soundNum: 6),
                  buildkey(color: Colors.purple, soundNum: 7),
                ],
              ),
            ),
          ),
        ));
  }
}
