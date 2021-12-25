// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creameColor,
      buttonColor: darkblueishColor,
      accentColor: darkblueishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        textTheme: Theme.of(context).textTheme,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
     primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreameColor,
      buttonColor: lightblueishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: Theme.of(context).textTheme,
      )
  );

  static Color creameColor = Color(0xfff5f5f5);
    static Color darkcreameColor = Vx.gray900;
    static Color lightblueishColor = Vx.indigo500;
  static Color darkblueishColor = Color(0xff403b58);
  // static Color darkgreen = Color.fromARGB(1, 1, 1, );
}
