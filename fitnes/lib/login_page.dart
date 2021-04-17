import 'package:fitnes/bmi_cal.dart';
import 'package:fitnes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: VxArc(
                height: 15.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.BOTTOM,
                child: Container(
                  color: Colors.white60,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                labelText: 'Username',
                                hintText: 'Enter Username',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  labelText: 'Password',
                                  hintText: 'Enter Password'),
                            ),
                          ),
                        ),
                        Center(
                          child: MyButton(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                          ),
                        ),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
