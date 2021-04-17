import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/omaxe.jpg'),
            ),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Contact us',
                textAlign: TextAlign.start,
                style: GoogleFonts.cinzel(
                  fontSize: 55,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Colors.teal,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.phone,
                          size: 35,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                      Center(
                        child: Text(
                          'Call us at'.toUpperCase(),
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          '9811101138\n'
                          '9891598030',
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                colour: Colors.red,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.home,
                        size: 35,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.black,
                    ),
                    Center(
                      child: Text('Address'.toUpperCase(),
                          style: GoogleFonts.cinzel(
                              fontSize: 30, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Shop Number 6&7\n'
                        'Omaxe palm green\n'
                        'Sector Mu\n'
                        'Greater Noida',
                        style: GoogleFonts.cinzel(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({
    @required this.colour,
    this.cardChild,
    this.onPress,
  });
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
