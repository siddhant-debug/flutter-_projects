import 'package:flutter/material.dart';

class CalCount extends StatefulWidget {
  const CalCount({Key key}) : super(key: key);

  @override
  _CalCountState createState() => _CalCountState();
}

class _CalCountState extends State<CalCount> {
  num age = 0, weight = 0, height = 0, bmr = 0, amr = 0;

  final TextEditingController t3 = new TextEditingController(text: '0');
  final TextEditingController t4 = new TextEditingController(text: '0');
  final TextEditingController t5 = new TextEditingController(text: '0');
  final TextEditingController t6 = new TextEditingController();
  String _chosenValue;
  void calBmr() {
    setState(
      () {
        age = int.parse(t3.text);
        weight = int.parse(t4.text);
        height = int.parse(t5.text);
        bmr = 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age);
        if (_chosenValue == 'Sedentary (little or no exercise)') {
          amr = bmr * 1.2;
          return amr;
        } else if (_chosenValue == 'Lightly active (exercise 1–3 days/week)') {
          amr = bmr * 1.375;
          return amr;
        } else if (_chosenValue ==
            'Moderately active (exercise 3–5 days/week)') {
          amr = bmr * 1.55;
          return amr;
        } else if (_chosenValue == 'Active (exercise 6–7 days/week)') {
          amr = bmr * 1.725;
          return amr;
        } else if (_chosenValue ==
            'Very active (hard exercise 6–7 days/week)') {
          amr = bmr * 1.9;
          return amr;
        }
      },
    );
  }

  // Sedentary (little or no exercise): AMR = BMR x 1.2
  // Lightly active (exercise 1–3 days/week): AMR = BMR x 1.375
  // Moderately active (exercise 3–5 days/week): AMR = BMR x 1.55
  // Active (exercise 6–7 days/week): AMR = BMR x 1.725
  // Very active (hard exercise 6–7 days/week): AMR = BMR x 1.9

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: t3,
            decoration: InputDecoration(
              labelText: 'Enter Age',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: t4,
            decoration: InputDecoration(
              labelText: 'Enter Weight',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: t5,
            decoration: InputDecoration(
              labelText: 'Enter Height',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: t6,
            decoration: InputDecoration(
              labelText: 'Enter Gender',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButton<String>(
            focusColor: Colors.white,
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>[
              'Sedentary (little or no exercise)',
              'Lightly active (exercise 1–3 days/week)',
              'Moderately active (exercise 3–5 days/week)',
              'Active (exercise 6–7 days/week)',
              'Very active (hard exercise 6–7 days/week)',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            hint: Text(
              "Please choose your Routine",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: calBmr,
          child: Text(
            'Req Calories',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text('Result : $bmr'),
            ),
          ),
        ),
      ],
    );
  }
}
