import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(30),
            height: h / 1.4,
            width: w,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/image.png'))),
          ),
          Container(
            child: Text(
              'Live Object Detection App in Flutter with Tflite',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 28),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            width: w,
            child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: Text(
                  'Start Detecting',
                  style: GoogleFonts.roboto(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                )),
          )
        ]),
      ),
    );
  }
}
