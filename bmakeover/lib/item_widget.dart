import 'package:bmakeover/wishlist.dart';
import 'package:bmakeover/wishmodel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'bmakemodel.dart';

class ItemWidget extends StatefulWidget {
  final Item item;
  const ItemWidget({@required this.item}) : assert(item != null);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(left: 12.0, right: 12.0),
      elevation: 7.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: GridTile(
        child: Image.network(widget.item.image),
        footer: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff403b58),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  widget.item.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                shape: CircleBorder(),
                color: Colors.red,
                onPressed: () {
                  final _catalog = CatalogModel();
                  final _wish = WishModel();
                  isAdded = isAdded.toggle();
                  setState(() {});
                },
                child: Icon(Icons.favorite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
