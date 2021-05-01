import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFieldBuilder(
                label: 'Enter Name',
              ),
              TextFieldBuilder(
                label: 'Enter Phone Number',
              ),
              TextFieldBuilder(
                label: 'Describe the accident',
                maxlines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldBuilder extends StatelessWidget {
  final String label;
  final int maxlines;
  TextFieldBuilder({this.label, this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
      ),
    );
  }
}
