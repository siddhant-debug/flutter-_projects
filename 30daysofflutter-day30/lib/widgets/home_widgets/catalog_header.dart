// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:velocity_x/velocity_x.dart';

//import '../themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "BMakeover"
              .text
              .xl5
              .bold
              .color(context.theme.accentColor)
              .textStyle(GoogleFonts.aladin())
              .make(),
          "Trending Products".text.xl2.textStyle(GoogleFonts.aladin()).make(),
        ],
      ),
    );
  }
}
