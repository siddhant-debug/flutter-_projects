import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class Staff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://i.pinimg.com/originals/4f/d4/0d/4fd40d35b99f9df092a9af0e50643f6a.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  foregroundImage: NetworkImage(
                      'https://image.freepik.com/free-vector/barbershop-haircutter-pop-art-vector-portrait_1441-3406.jpg'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 30,
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name : '.toUpperCase(),
                        style: GoogleFonts.bangers(fontSize: 30),
                      ),
                      Text(
                        'Javed Habib',
                        style: GoogleFonts.bangers(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 250,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Type : '.toUpperCase(),
                        style: GoogleFonts.bangers(fontSize: 30),
                      ),
                      Text(
                        ' Unisex ',
                        style: GoogleFonts.bangers(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 80,
                  foregroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE6fxh3RKxzSjR68qP2hZEflJJLLrunYNmvA&usqp=CAU'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 250,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Name : '.toUpperCase(),
                        style: GoogleFonts.bangers(fontSize: 30),
                      ),
                      Text(
                        'Rano Mandal',
                        style: GoogleFonts.bangers(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 20,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 250,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'type : '.toUpperCase(),
                        style: GoogleFonts.bangers(fontSize: 30),
                      ),
                      Text(
                        'Women',
                        style: GoogleFonts.bangers(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
