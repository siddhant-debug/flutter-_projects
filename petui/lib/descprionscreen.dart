import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petui/configuration.dart';

class DescScreen extends StatefulWidget {
  @override
  _DescScreenState createState() => _DescScreenState();
}

class _DescScreenState extends State<DescScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blueGrey.shade300,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Container(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        'The cat is a domestic species of small carnivorous mammal.\n'
                        ' It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 32,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                  tag: 'catimage', child: Image.asset('images/pet-cat2.png')),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: shadowList,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lily',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.contact_support,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                        Text(
                          'Absyincan Cat',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text('2 years old'),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.add_location,
                              color: Colors.teal,
                            ),
                            Text('Alpha 2 Greater Noida , Gautam Buddha Nagar'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: shadowList,
                      color: Colors.green,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: shadowList,
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'Adoption',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
