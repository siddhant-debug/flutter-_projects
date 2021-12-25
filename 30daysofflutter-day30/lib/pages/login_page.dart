// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/undraw_hey_email_liaa.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 50)),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 20),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 35,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done_outlined,
                                color: Colors.white,
                              )
                            : Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Material(
                    color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.signup);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 35,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done_outlined,
                                color: Colors.white,
                              )
                            : Text("SignUp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
