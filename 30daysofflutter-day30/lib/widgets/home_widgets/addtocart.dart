// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/core/store.dart';
import 'package:project1/models/cart.dart';
import 'package:project1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart
          ? Icon(Icons.done)
          : Icon(
              CupertinoIcons.heart_fill,
              color: Colors.red,
            ),
    );
  }
}
