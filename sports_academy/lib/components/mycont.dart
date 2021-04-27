import 'package:flutter/material.dart';

class MyCont extends StatelessWidget {
  const MyCont({
    @required this.title,
    @required this.shadowList,
    this.color,
  });

  final List<BoxShadow> shadowList;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 20,
        width: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
          color: Colors.white,
          boxShadow: shadowList,
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
