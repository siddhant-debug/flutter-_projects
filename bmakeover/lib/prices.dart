import 'package:bmakeover/bmakemodel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bmakeover/themes.dart';

const kCard = Color(0xFF111328);

class PricePage extends StatelessWidget {
  PricePage({this.catalog}) : assert(catalog != null);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: catalog.name.text.uppercase.make(),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(catalog.image),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: VxBox(
                    child: Container(
                      color: Colors.black87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          catalog.desc.text.bold.xl3.green500.uppercase.make(),
                          Text(
                            'Rs.${catalog.price.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0,
                            ),
                          ).shimmer(),
                        ],
                      ),
                    ),
                  ).make(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
