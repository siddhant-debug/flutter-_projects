import 'package:fitnes/BottomNaviPage.dart';
import 'package:fitnes/bmi_cal.dart';
import 'package:flutter/material.dart';

class TrackFood extends StatefulWidget {
  @override
  _TrackFoodState createState() => _TrackFoodState();
}

class _TrackFoodState extends State<TrackFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Calories'),
        backgroundColor: Color(0xFF111328),
      ),
      body: SingleChildScrollView(
        child: Container(
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
              MyButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNaviPage(),
    );
  }
}

class ReusableCard extends StatefulWidget {
  const ReusableCard({@required this.label, @required this.hint});
  final String label;
  final String hint;

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
            widget.label,
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
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                controller: myController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
