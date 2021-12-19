import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(fontSize: 22),
        maxLines: null,
        decoration: InputDecoration.collapsed(
          hintText: 'Push Pull Legs ',
          hintStyle: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
