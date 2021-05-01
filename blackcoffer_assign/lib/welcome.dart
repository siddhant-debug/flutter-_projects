import 'package:blackcoffer_assign/homescreen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              // child: Image.network(
              //   'https://thumbs.dreamstime.com/b/crashed-car-road-accident-police-officer-uniform-issuing-report-policeman-writing-legal-fine-document-city-buildings-crashed-134430085.jpg',
              //   fit: BoxFit.fitWidth,
              // ),
              ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Email',
              hintText: 'Example@gmail.com',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Password',
              hintText: 'Enter password',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepPurpleAccent),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                letterSpacing: 1.7,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
