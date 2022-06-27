import 'dart:convert';
import 'package:bmakeover/bmakemodel.dart';
import 'package:bmakeover/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmakeover/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/bmakeover.json");
    var decodeddata = jsonDecode(catalogjson);
    var prdocutsdata = decodeddata["products"];
    CatalogModel.Items = List.from(prdocutsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
