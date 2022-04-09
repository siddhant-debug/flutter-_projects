import 'package:flutter/material.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:provider/provider.dart';

class Responsive extends StatefulWidget {
  final Widget mobileScreen;
  final Widget desktopScreen;
  const Responsive({
    Key? key,
    required this.mobileScreen,
    required this.desktopScreen,
  }) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userprovider = Provider.of(context, listen: false);
    await _userprovider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return widget.desktopScreen;
        } else {
          return widget.mobileScreen;
        }
      },
    );
  }
}
