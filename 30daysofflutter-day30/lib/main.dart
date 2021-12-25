import 'package:flutter/material.dart';
import 'package:project1/core/store.dart';
import 'package:project1/pages/cartpage.dart';
import 'package:project1/pages/contacts.dart';

import 'package:project1/pages/login_page.dart';
import 'package:project1/pages/signup.dart';
import 'package:project1/pages/staff.dart';
import 'package:project1/pages/toabout.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/home.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => Loginpage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => Loginpage(),
        MyRoutes.toabout: (context) => About(),
        MyRoutes.contacts: (context) => Contacts(),
        MyRoutes.staff: (context) => Staff(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.signup: (context) => SignupPage(),
      },
    );
  }
}
