import 'dart:io';
import 'dart:typed_data';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pytorch_mobile/model.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';
import 'package:image/image.dart' as img;
import 'package:tflite/tflite.dart';

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
  late int bottomNavIndex = 0;
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

  // ByteData data = await rootBundle.load('assets/images/bill_gates.jpg');
  // img.Image? bill_image = img.decodeImage(data.buffer.asUint8List());
  // bill_image = img.grayscale(bill_image!);
  // bill_image = img.copyResize(
  // bill_image,
  // width: 48,
  // height: 48,
  // );

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
        File.fromRawPath(imageBytes!), 48, 48, label);

    print(_imagePrediction);
  }

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
                        child: Image(
                          image: MemoryImage(imageBytes!),
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
                setState(
                  () {
                    isAdded = false;
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
