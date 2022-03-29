import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:pytorch_mobile/model.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _prediction = '';
  File? _image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();
  Model? _imageModel;

  @override
  void initState() {
    super.initState();
    try {
      loadModel();
    } on PlatformException {}
  }

  Future loadModel() async {
    String pathImageModel = "assets/model.pt";
    try {
      _imageModel = await PyTorchMobile.loadModel(pathImageModel);
    } on PlatformException {
      print("only supported for android and ios so far");
    }
  }

  getImage() async {
    var tempStore = await _picker.pickImage(
        source: ImageSource.camera, maxWidth: 400.0, maxHeight: 400.0);
    var imageData = (await tempStore!.readAsBytes());
    imageFile = (await decodeImageFromList(imageData)) as File?;
    await makePrediction(imageFile!);
    setState(
      () {
        _image = File(tempStore.path);
      },
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> makePrediction(File file) async {
    String? prediction;
    try {
      prediction = await _imageModel?.getImagePrediction(
          file, 48, 48, 'assets/labels.txt');
    } on PlatformException {
      prediction = 'Failed to get prediction.';
    }
    if (!mounted) return;
    setState(() {
      _prediction = prediction!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Torch mobile image prediction app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (_image != null) Center(child: Image.file(_image!)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_prediction\n',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: const Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
