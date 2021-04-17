import 'package:fitnes/bmi_cal.dart';
import 'package:fitnes/body_fat.dart';
import 'package:fitnes/home_page.dart';
//import 'package:fitnes/login_page.dart';
import 'package:fitnes/track_food.dart';
import 'package:flutter/material.dart';

class BottomNaviPage extends StatefulWidget {
  @override
  _BottomNaviPageState createState() => _BottomNaviPageState();
}

class _BottomNaviPageState extends State<BottomNaviPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          backgroundColor: Color(0xFFEB1555),
          icon: Icon(
            Icons.home,
          ),
          label: 'Workout',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.accessibility_outlined,
          ),
          label: 'Body Fat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.fitness_center_rounded,
          ),
          label: 'Bmi',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.food_bank_outlined,
          ),
          label: 'Calories',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (selectedIndex) {
        if (selectedIndex == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return HomePage();
            }),
          );
        } else if (selectedIndex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return BodyFat();
            }),
          );
        } else if (selectedIndex == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return BmiCal();
            }),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TrackFood();
            }),
          );
        }
      },
    );
  }
}
