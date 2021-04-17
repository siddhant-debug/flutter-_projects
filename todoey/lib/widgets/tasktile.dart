import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallBack});
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      value: isChecked,
      onChanged: checkboxCallBack,
    );
  }
}
