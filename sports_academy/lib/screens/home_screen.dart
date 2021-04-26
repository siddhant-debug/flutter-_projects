import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sports_academy/models/academy.dart';
import 'package:sports_academy/screens/Coachingstaff.dart';
import 'package:sports_academy/screens/add_academy.dart';
import 'package:sports_academy/screens/notification.dart';
import 'package:sports_academy/screens/profile.dart';

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
        'F-420 Alpha 2 greater noida')
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
            //showUnselectedLabels: false,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: ExpansionTile(
                  initiallyExpanded: true,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Flexible(child: Card(child: Text('All'))),
                            Flexible(child: Card(child: Text('All'))),
                            Flexible(child: Card(child: Text('All'))),
                            Flexible(child: Card(child: Text('All'))),
                            Flexible(child: Card(child: Text('All'))),
                          ],
                        ),
                        Card(child: Text('All')),
                        Card(child: Text('All')),
                      ],
                    ),
                  ],
                  title: Text('hello'),
                ),
              ),
              AcadCont(academy: academy, shadowList: shadowList),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomLeft,
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => AddAcademy(),
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
        ),
      ],
    );
  }
}

class AcadCont extends StatelessWidget {
  const AcadCont({
    Key key,
    @required this.academy,
    @required this.shadowList,
  }) : super(key: key);

  final List<Academy> academy;
  final List<BoxShadow> shadowList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: academy.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    academy[index].newAcademyName,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        height: 30,
                        width: 30,
                        child: Center(
                            child: Text(academy[index].numPlayers.toString())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('players')
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        height: 30,
                        width: 30,
                        child: Center(
                            child: Text(academy[index].numCoaches.toString())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Coaches')
                    ],
                  ),
                  Text(
                    'Football',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Center Head : ${academy[index].cHead}'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Location : ${academy[index].Address}'),
              )
            ],
          ),
        );
      },
    );
  }
}
