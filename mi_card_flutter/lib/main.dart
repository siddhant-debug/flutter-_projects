import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.red,
              foregroundImage: AssetImage('images/IMG_20201207_093140_527.jpg'),
            ),
          ),
          Text(
            "Siddhant Tomar",
            style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Source Sans Pro',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                color: Colors.teal[100]),
          ),
          SizedBox(
            height: 20,
            width: 190,
            child: Divider(
              color: Colors.teal.shade200,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 30,
                  color: Colors.teal.shade900,
                ),
                title: Text(
                  " : +91 9205630764",
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                )),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.teal.shade900,
                ),
                title: Text(
                  " : siddhanttomar80@gmail.com",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              )),
        ])),
      ),
    );
  }
}
