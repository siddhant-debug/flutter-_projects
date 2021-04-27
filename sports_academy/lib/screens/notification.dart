import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[400], blurRadius: 20, offset: Offset(0, 10))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
            ),
            child: ListTile(
              subtitle: Text('Coach : Marcus Reus'),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              autofocus: true,
              title: Text(
                  'Congratulations ! You just enrolled in one of our academy'),
              leading: Icon(Icons.notification_important),
              trailing: Icon(Icons.add_location),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
            ),
            child: ListTile(
              subtitle: Text('Coach : Marcus Reus'),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              autofocus: true,
              title: Text(
                  'Congratulations ! You just enrolled in one of our academy'),
              leading: Icon(Icons.notification_important),
              trailing: Icon(Icons.add_location),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
            ),
            child: ListTile(
              subtitle: Text('Coach : Marcus Reus'),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              autofocus: true,
              title: Text(
                  'Congratulations ! You just enrolled in one of our academy'),
              leading: Icon(Icons.notification_important),
              trailing: Icon(Icons.add_location),
            ),
          ),
        ],
      ),
    );
  }
}
