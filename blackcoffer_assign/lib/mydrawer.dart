import 'package:blackcoffer_assign/reports.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 7,
      child: Container(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black38),
              accountName: Text('Siddhant Tomar'),
              accountEmail: Text('siddhanttomar@hotmail.com'),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    ),
                  ],
                  //shape: BoxShape.circle,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'MIS',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReportPage(),
                  ),
                );
              },
              title: Text(
                'Reports',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.assignment_turned_in_outlined,
                size: 30,
              ),
            ),
            ListTile(
              title: Text(
                'Daily Logs',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.assignment_rounded,
                size: 30,
              ),
            ),
            ListTile(
              title: Text(
                'Safety meeting loggers',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.account_balance_wallet_sharp,
                size: 30,
              ),
            ),
            ListTile(
              title: Text(
                'Internal Audit Reports',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.analytics_outlined,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
