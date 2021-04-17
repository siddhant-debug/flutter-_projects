import 'package:fitnes/bmi_cal.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  InfoPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: kInactiveCard,
        appBar: AppBar(
          //backgroundColor: kInactiveCard,
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Your Result',
                    //style: kTitleText,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Card(
                //colour: kActiveCard,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      //style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      //style: kBmiResultStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      // style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
