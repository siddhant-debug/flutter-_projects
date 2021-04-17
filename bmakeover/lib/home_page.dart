import 'package:bmakeover/Aboutus.dart';
import 'package:bmakeover/contactus.dart';
import 'package:bmakeover/item_widget.dart';
import 'package:bmakeover/prices.dart';
import 'package:bmakeover/staff.dart';
import 'package:bmakeover/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bmakeover/themes.dart';
import 'bmakemodel.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({this.lit});
  final Item lit;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Aboutus();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'BMakeOver'.toUpperCase(),
                style: GoogleFonts.pacifico(
                  fontSize: 30,
                  height: 2,
                ),
              ),
              Divider(
                thickness: 5,
                color: Colors.black54,
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/4f/d4/0d/4fd40d35b99f9df092a9af0e50643f6a.jpg'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (CatalogModel.Items != null &&
                          CatalogModel.Items.isNotEmpty)
                      ? VxSwiper.builder(
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          scrollDirection: Axis.vertical,
                          height: 500,
                          itemCount: CatalogModel.Items.length,
                          itemBuilder: (context, index) {
                            final products = CatalogModel.Items[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PricePage(
                                      catalog: products,
                                    ),
                                  ),
                                );
                              },
                              child: ItemWidget(
                                item: products,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepOrange,
                          ).p32(),
                        ),
                ),
              ),
              Divider(
                height: 10,
                thickness: 4,
                color: Colors.black54,
              ),
            ],
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: MyTheme.creameColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return WishList();
                }),
              );
            },
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ).badge(
            color: Colors.red,
            size: 23,
            count: 5,
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
