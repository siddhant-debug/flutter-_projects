import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File imagefile;
  final ImagePicker _picker = ImagePicker();
  //var imageValue;
  var result = "";
  bool isAdded = false;

  getImageFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imagefile = File(photo!.path);
      isAdded = true;
    });
  }

  getVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    setState(() {
      imagefile = File(video!.path);
      isAdded = true;
    });
  }

  getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagefile = File(image!.path);
      isAdded = true;
    });
  }

  readTextFromImage() async {
    result = " ";
    final inputImage = InputImage.fromFile(imagefile);
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement element in line.elements) {
          setState(() {
            result = result + ' ' + element.text;
          });
        }
      }
    }
  }

  readBarcode() async {
    result = " ";
    final inputImage = InputImage.fromFile(imagefile);
    final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

    final List barcodes = await barcodeScanner.processImage(inputImage);
    for (Barcode rbarcode in barcodes) {
      setState(() {
        result = rbarcode.value.displayValue!;
      });
    }
  }

  Future readLabel() async {
    result = " ";
    final inpuImage = InputImage.fromFile(imagefile);
    final labelScanner = GoogleMlKit.vision.imageLabeler();
    List labels = await labelScanner.processImage(inpuImage);
    for (ImageLabel label in labels) {
      final String text = label.label;
      final double confidence = label.confidence;
      final int index = label.index;
      setState(() {
        result = result + "$index = $text  - $confidence '\n ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Ml App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: isAdded
                  ? Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(imagefile),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 250,
                      width: 250,
                      color: Colors.grey,
                    ),
            ),
            ElevatedButton(
              onPressed: () {
                getImageFromGallery();
              },
              onLongPress: () {
                getImageFromCamera();
              },
              child: const Icon(Icons.photo_camera_outlined),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: readTextFromImage,
                    child: const Text("Text conv"),
                  ),
                  ElevatedButton(
                    onPressed: readBarcode,
                    child: const Text("Barcode "),
                  ),
                  ElevatedButton(
                    onPressed: readLabel,
                    child: const Text("Label"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Facial"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                result,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
