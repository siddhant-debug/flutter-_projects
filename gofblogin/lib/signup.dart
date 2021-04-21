import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofblogin/Home.dart';
import 'package:gofblogin/googlelog.dart';
import 'package:gofblogin/social_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isLoggedIn = false;
  GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/back1.jpg')),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Enter Email',
                  icon: Icon(Icons.account_circle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Enter Password',
                  icon: Icon(Icons.keyboard),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Confirm Password',
                  icon: Icon(Icons.keyboard),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => GooLog()));
              },
              child: Text('Sign up'),
            ),
            Container(
              width: size.width * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      height: 1.5,
                      color: Color(0xFFD90909),
                    ),
                  ),
                  Text(
                    'OR Register With',
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                  Expanded(
                    child: Divider(
                      height: 1.5,
                      color: Color(0xFFD90909),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalIcon(
                    color: Colors.blue,
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    color: Colors.blueAccent,
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    color: Colors.red,
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {
                      _googleSignIn.signIn().then(
                        (userData) {
                          setState(
                            () {
                              if (_isLoggedIn = true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(
                                      log: userData,
                                    ),
                                  ),
                                );
                              }
                              _userObj = userData;
                            },
                          );
                        },
                      ).catchError(
                        (e) {
                          print(e);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
