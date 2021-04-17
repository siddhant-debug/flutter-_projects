import 'package:bmakeover/contactus.dart';
import 'package:bmakeover/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white10,
        //   elevation: 8.0,
        //   title: 'ABOUT US'.text.xl3.make(),
        // ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'About Us',
                style: GoogleFonts.aladin(fontSize: 70),
              ),
              Container(
                height: 270,
                child: Image.asset(
                  'assets/images/bmake.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              ReusableCard(
                colour: Colors.white10,
                cardChild: Text(
                  'BMakeOvers always endeavors to teach and prepare their beauticians\n'
                  ' about the most recent procedures and styles with the cutting edge innovation,\n'
                  ' by sending the beauticians to different classes and by taking an interest in different occasions over all kinds.',
                  style: GoogleFonts.aladin(fontSize: 27),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
