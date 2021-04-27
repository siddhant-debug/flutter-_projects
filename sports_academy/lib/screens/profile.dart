import 'package:flutter/material.dart';
import 'package:sports_academy/screens/seetingpage.dart';
//import 'package:sports_academy/screens/home_screen.dart';

bool showPass = false;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          )
        ],
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/person.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          shape: BoxShape.circle,
                          color: Colors.tealAccent,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BuildTextField(
                labeltext: 'Enter Name',
                hinttext: 'Enter Name',
                obText: false,
              ),
              BuildTextField(
                labeltext: 'Enter Password ',
                hinttext: 'Enter Password ',
                obText: true,
              ),
              BuildTextField(
                labeltext: 'Confirm Password ',
                hinttext: 'Confirm Password',
                obText: true,
              ),
              BuildTextField(
                obText: false,
                labeltext: 'Location',
                hinttext: 'Location',
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    color: Colors.white,
                    child: Text('Cancel',
                        style: TextStyle(
                            letterSpacing: 3,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    color: Colors.green,
                    child: Text(
                      'Save',
                      style: TextStyle(
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTextField extends StatefulWidget {
  final String hinttext;
  final String labeltext;
  final bool obText;
  const BuildTextField({this.hinttext, this.labeltext, this.obText});

  @override
  _BuildTextFieldState createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextField(
        obscureText: widget.obText ? showPass : false,
        decoration: InputDecoration(
          suffixIcon: widget.obText
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                )
              : null,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hinttext,
          labelText: widget.labeltext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
