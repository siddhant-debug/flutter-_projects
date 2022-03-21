import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';
import 'package:pytorch_mobile/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Model? imageModel;
  String? _imagePrediction;
  Uint8List? imageBytes;
  bool isAdded = false;
  String label = "assets/labels/labels.csv";

  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    XFile? _file = await _picker.pickImage(source: source);
    imageBytes = await _file?.readAsBytes();
    if (imageBytes != null) {
      ImageCropping.cropImage(
        context: context,
        imageBytes: imageBytes!,
        onImageDoneListener: (data) {
          setState(
            () {
              imageBytes = data;
              isAdded = true;
            },
          );
        },
      );
    }
  }

  Future loadModel() async {
    String pathImageModel = "assets/models/model.pt";
    try {
      imageModel = await PyTorchMobile.loadModel(pathImageModel);
    } on PlatformException {
      print("only on ios and and");
    }
  }

  Future runImageModel() async {
    _imagePrediction = await imageModel?.getImagePrediction(
        File.fromRawPath(imageBytes!), 224, 224, label);
    print(_imagePrediction);
  }

  void getImageFromGallery() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      imageBytes = im;
      isAdded = true;
    });
  }

  void getImageFromCamera() async {
    Uint8List im = await pickImage(ImageSource.camera);
    setState(() {
      imageBytes = im;
      isAdded = true;
    });
  }

  late int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Click And Crop"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
                isAdded
                    ? SizedBox(
                        width: 300,
                        height: 250,
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.matrix(<double>[
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: Image(
                            image: MemoryImage(imageBytes!),
                          ),
                        ),
                      )
                    : Container(
                        width: 300,
                        height: 250,
                        color: Colors.grey,
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton: FabCircularMenu(
          animationCurve: Curves.easeIn,
          ringDiameter: 300,
          ringWidth: 60,
          children: [
            IconButton(
              onPressed: () {
                getImageFromCamera();
              },
              icon: const Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {
                getImageFromGallery();
              },
              icon: const Icon(Icons.photo_library_sharp),
            ),
            IconButton(
              onPressed: () {
                runImageModel();
              },
              icon: const Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isAdded = false;
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
