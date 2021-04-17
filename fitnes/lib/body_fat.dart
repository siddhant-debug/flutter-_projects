import 'package:fitnes/BottomNaviPage.dart';
import 'package:fitnes/bmi_cal.dart';
import 'package:flutter/material.dart';
import 'package:fitnes/track_food.dart';

class BodyFat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Fat % Calculator'),
        backgroundColor: Color(0xFF111328),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              ReusableCard(
                label: 'Gender :',
                hint: 'Enter Gender',
              ),
              ReusableCard(
                label: 'Age    :',
                hint: 'Enter Age',
              ),
              ReusableCard(
                label: 'Height :',
                hint: 'Enter Height',
              ),
              ReusableCard(
                label: 'Weight :',
                hint: 'Enter Weight',
              ),
              ReusableCard(
                label: 'Neck   :',
                hint: 'Enter Neck Size',
              ),
              ReusableCard(
                label: 'Waist  :',
                hint: 'Enter Waist Size',
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
