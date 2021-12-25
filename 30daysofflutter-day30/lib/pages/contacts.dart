import 'package:flutter/material.dart';
import 'package:project1/widgets/themes.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creameColor,
        appBar: AppBar(
          backgroundColor: MyTheme.darkblueishColor,
          title: Text("contact us"),
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: ListView(
             children: [
               ListTile(
                 leading: Icon(
                   Icons.contact_phone_sharp,
                   color: Colors.black,
                 ),
                 title: Text(": 9811101138 / 9891598030 " ,style: TextStyle(
                   color: Colors.black,
                 ),),
               ),
               ListTile(
                 leading: Icon(
                   Icons.email_sharp,
                   color: Colors.black,
                 ),
                 title: Text(": siddhanttomar@hotmail.com" ,style: TextStyle(
                   color: Colors.black,
                 )),
               ),
               ListTile(
                 leading: Icon(
                   Icons.home_filled,
                   color: Colors.black,
                 ),
                 title: Text(": Shop No. 6 & 7 , omaxe palm green , mu , Greater Noida ",style: TextStyle(
                   color: Colors.black,
                 )),
               )
             ],
          ),
        ));
  }
}
