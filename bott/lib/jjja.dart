import 'package:flutter/material.dart';

class TrackFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Calories'),
        backgroundColor: Color(0xFF111328),
      ),
      body: Container(
        child: Column(
          children: [
            ReusableCard(
              label: 'Age :',
              hint: 'Enter Age',
            ),
            SizedBox(
              height: 30,
            ),
            ReusableCard(
              label: 'Weight :',
              hint: 'Enter Weight',
            ),
            SizedBox(
              height: 30,
            ),
            ReusableCard(
              label: 'Height :',
              hint: 'Enter Height',
            ),
            SizedBox(
              height: 30,
            ),
            ReusableCard(
              label: 'Gender',
              hint: 'Enter Gender',
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({this.label, this.hint});
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      elevation: 10.0,
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: hint, hintStyle: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
