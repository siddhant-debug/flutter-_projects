import 'package:flutter/material.dart';
import 'package:sports_academy/models/academy.dart';

class AddCad extends StatelessWidget {
  const AddCad({
    Key key,
    @required this.academy,
    @required this.shadowList,
  }) : super(key: key);

  final List<Academy> academy;
  final List<BoxShadow> shadowList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: academy.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: shadowList,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    academy[index].newAcademyName,
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        height: 30,
                        width: 30,
                        child: Center(
                            child: Text(academy[index].numPlayers.toString())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('players')
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.grey.shade300,
                        height: 30,
                        width: 30,
                        child: Center(
                            child: Text(academy[index].numCoaches.toString())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Coaches')
                    ],
                  ),
                  Text(
                    'Football',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Center Head : ${academy[index].cHead}'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Location : ${academy[index].Address}'),
              )
            ],
          ),
        );
      },
    );
  }
}
