// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/core/store.dart';
import 'package:project1/models/cart.dart';
import 'dart:convert';
import 'package:project1/models/catalog.dart';
import 'package:project1/pages/contacts.dart';
import 'package:project1/pages/staff.dart';
import 'package:project1/pages/toabout.dart';
import 'package:project1/utils/routes.dart';

import 'package:project1/widgets/home_widgets/catalog_header.dart';
import 'package:project1/widgets/home_widgets/catalog_list.dart';
//import 'package:project1/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/bmakeover.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return About();
          }),
        );
      } else if (_selectedIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Staff();
          }),
        );
      } else if (_selectedIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Contacts();
          }),
        );
      }
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ).badge(
          color: Colors.red,
          size: 30,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'ABOUT US',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face,
              color: Colors.black,
            ),
            label: 'STAFF',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone,
              color: Colors.black,
            ),
            label: 'CONTACT US',
          ),
        ],
      ),
    );
  }
}
