import 'package:bmakeover/bmakemodel.dart';
import 'package:bmakeover/wishmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          title: 'Wishlist'.text.xl3.black.make(),
        ),
        body: Column(
          children: [
            _WishList().p32().expand(),
            Divider(),
            _WishTotal(),
          ],
        ),
      ),
    );
  }
}

class _WishTotal extends StatelessWidget {
  final _Wish = WishModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: 'Rs.${_Wish.totalPrice}'
          .text
          .color(Colors.red)
          .textStyle(GoogleFonts.abhayaLibre())
          .xl5
          .make(),
    );
  }
}

class _WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<_WishList> {
  @override
  Widget build(BuildContext context) {
    final _Wish = WishModel();
    return ListView.builder(
      itemCount: _Wish.Items?.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.done,
            size: 34,
          ),
          title: _Wish.Items[index].name.text.xl3.make(),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_circle_outline,
              size: 34,
            ),
          ),
        );
      },
    );
  }
}
