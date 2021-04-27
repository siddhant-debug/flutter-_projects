import 'package:flutter/material.dart';
import 'package:sports_academy/components/mycont.dart';

class ListViewW extends StatefulWidget {
  const ListViewW({
    Key key,
    @required this.shadowList,
  }) : super(key: key);

  final List<BoxShadow> shadowList;

  @override
  _ListViewWState createState() => _ListViewWState();
}

class _ListViewWState extends State<ListViewW> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              ExpansionTile(
                title: Text('Show Categories'),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyCont(title: 'All', shadowList: widget.shadowList),
                          MyCont(
                              title: 'Basketball',
                              shadowList: widget.shadowList),
                          MyCont(
                              title: 'Football', shadowList: widget.shadowList),
                          MyCont(
                              title: 'Tennis', shadowList: widget.shadowList),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyCont(
                              title: 'Fencing', shadowList: widget.shadowList),
                          MyCont(
                              title: 'Swimming', shadowList: widget.shadowList),
                          MyCont(
                              title: 'Hockey', shadowList: widget.shadowList),
                          MyCont(
                              title: 'Karate', shadowList: widget.shadowList),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
