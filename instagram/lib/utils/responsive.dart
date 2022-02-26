import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;
  const Responsive({
    Key? key,
    required this.mobileScreen,
    required this.desktopScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return desktopScreen;
        } else {
          return mobileScreen;
        }
      },
    );
  }
}
