import 'package:flutter/material.dart';
import 'package:project1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/bg3.jpg"),
            fit: BoxFit.cover,
          )),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Username",
                          hintText: "Enter username",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.accentColor,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email ID",
                          hintText: "Enter Email ID",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.accentColor,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter password",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.accentColor,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Confirm Password ",
                          hintText: "confirm password",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: context.accentColor,
                          )),
                    ),
                  ),
                  ElevatedButton(
                    child: Text(
                      "Back",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
