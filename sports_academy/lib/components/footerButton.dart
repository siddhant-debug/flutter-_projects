import 'package:flutter/material.dart';
import 'package:sports_academy/screens/add_academy.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => AddAcademy(
                (newAcademyName, numPlayers, numCoaches, cHead, Address) {}),
          );
        },
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Add new Academy',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
