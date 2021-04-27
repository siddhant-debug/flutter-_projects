import 'package:flutter/material.dart';

class AddAcademy extends StatelessWidget {
  final Function AddAcademyCallback;

  const AddAcademy(this.AddAcademyCallback);
  @override
  Widget build(BuildContext context) {
    String newAcademyName;
    int numPlayers;
    int numCoaches;
    String cHead;
    String Address;
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter Academy Name'),
                  onChanged: (newa) {
                    newAcademyName = newa;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Number Of Players'),
                  onChanged: (newpl) {
                    //numPlayers = newpl;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Number of Coaches'),
                  onChanged: (newCo) {
                    //numCoaches = newCo;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Center Head'),
                  onChanged: (newH) {
                    cHead = newH;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter Address'),
                  onChanged: (newAd) {
                    Address = newAd;
                  },
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                onPressed: () {
                  AddAcademyCallback(
                      newAcademyName, numPlayers, numCoaches, cHead, Address);
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
