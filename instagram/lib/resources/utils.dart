import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _picker = ImagePicker();
  XFile? _file = await _picker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      backgroundColor: Colors.grey,
      content: Text(
        content,
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
    ),
  );
}
