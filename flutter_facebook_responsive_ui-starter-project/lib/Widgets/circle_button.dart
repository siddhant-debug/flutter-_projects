import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Icon icon;
  final Function onPress;
  const CircleButton({
    Key key,
    @required this.icon,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: 30,
        color: Colors.black,
        onPressed: onPress,
        icon: icon,
      ),
    );
  }
}
