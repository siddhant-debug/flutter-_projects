import 'dart:io';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Emotion detection",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File pickedImage;
  late bool isAdded = false;
  var imageFile;
  String output = " ";

  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  getImageFromCamera() async {
    var tempStore = await _picker.pickImage(source: ImageSource.camera);
    imageFile = await tempStore!.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);
    //final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = File(tempStore.path);
      isAdded = true;
      //isFace = false;
      imageFile = imageFile;
    });
  }

  getImageFromGallery() async {
    var tempStore = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = await tempStore!.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);
    //final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore.path);
      isAdded = true;
      //isFace = false;
      imageFile = imageFile;
    });
  }

  runModel() async {
    if (imageFile != null) {
      var predictions = await Tflite.runModelOnImage(
          path: imageFile, // required
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 2, // defaults to 5
          threshold: 0.2, // defaults to 0.1
          asynch: true // defaults to true
          );
      for (var element in predictions!) {
        setState(() {
          output = element["labels"];
        });
      }
    }
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EmotionDetect Krte hai "),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: isAdded
                  ? Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(pickedImage),
                        ),
                      ),
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      color: Colors.blueGrey,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                onPressed: () {
                  getImageFromGallery();
                },
                icon: const Icon(
                  Icons.photo_library,
                  color: Colors.black,
                ),
                label: const Text("Gallery"),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                onPressed: () {
                  getImageFromCamera();
                },
                icon: const Icon(
                  Icons.camera_enhance_rounded,
                  color: Colors.black,
                ),
                label: const Text("Camera"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: runModel,
            child: const Text("Press"),
          ),
          Text(
            output,
          ),
        ],
      ),
    );
  }
}
