import 'package:apihandle/models/factsrespo.dart';
import 'package:apihandle/services/servFacts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  FactsResponse factsResponse = FactsResponse();
  ServFacts servFacts = ServFacts();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Siddhant News'),
        ),
        body: Center(
          child: Container(
            child: FutureBuilder(
              future: servFacts.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  FactsResponse factsResponse = snapshot.data;
                  return ListView.builder(
                    itemCount: factsResponse.facts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              factsResponse.facts[index].id.toString(),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              factsResponse.facts[index].title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              factsResponse.facts[index].description,
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
