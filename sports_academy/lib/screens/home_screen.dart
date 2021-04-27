import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_academy/components/footerButton.dart';
import 'package:sports_academy/components/listviewW.dart';
import 'package:sports_academy/components/listviewbuild.dart';
import 'package:sports_academy/components/mycont.dart';
import 'package:sports_academy/models/academy.dart';
import 'package:sports_academy/screens/Coachingstaff.dart';
//import 'package:sports_academy/screens/add_academy.dart';
import 'package:sports_academy/screens/notification.dart';
import 'package:sports_academy/screens/profile.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[400], blurRadius: 20, offset: Offset(0, 10))
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CoachingSatff();
          }),
        );
      } else if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return NotificationPage();
          }),
        );
      } else if (_selectedIndex == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Profile();
          }),
        );
      }
    });
  }

  int _selectedIndex = 0;
  List<Academy> academy = [
    Academy('Nike cricket club', 20, 3, 'Siddhant Tomar',
        'F-420 Alpha 2 greater noida'),
    Academy('Nike cricket club', 20, 3, 'Siddhant Tomar',
        'F-420 Alpha 2 greater noida'),
    Academy('Nike cricket club', 20, 3, 'Siddhant Tomar',
        'F-420 Alpha 2 greater noida'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('DASHBOARD'),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          height: 80,
          child: BottomNavigationBar(
            unselectedIconTheme: IconThemeData(color: Colors.black38),
            selectedIconTheme: IconThemeData(color: Colors.black),
            selectedLabelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            elevation: 7,
            backgroundColor: Colors.white,
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports,
                ),
                label: 'Coaching staff',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notification_important,
                ),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                ListViewW(shadowList: shadowList),
                AddCad(academy: academy, shadowList: shadowList),
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        FooterButton(),
      ],
    );
  }
}
