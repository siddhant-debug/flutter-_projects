import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/widgets/themes.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creameColor,
      appBar: AppBar(
        backgroundColor: MyTheme.darkblueishColor,
        title: Text("About us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Image.asset(
                "assets/images/parlour-1590994911.jpg",
                fit: BoxFit.cover,
              ),
              Text(
                'BMakeOvers always endeavors to teach and prepare their beauticians\n'
                ' about the most recent procedures and styles with the cutting edge innovation,\n'
                ' by sending the beauticians to different classes and by taking an interest in different occasions over all kinds.',
                style: GoogleFonts.aladin(fontSize: 27, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
