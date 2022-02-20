import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class QuantumPage extends StatefulWidget {
  const QuantumPage({Key? key}) : super(key: key);

  @override
  State<QuantumPage> createState() => _QuantumPageState();
}

class _QuantumPageState extends State<QuantumPage> {
  late File pickedImage;
  var imageFile;
  List<Rect> rect = <Rect>[];
  late bool isAdded = false;
  late bool isFace = false;
  final ImagePicker _picker = ImagePicker();

  getImageFromCamera() async {
    var tempStore = await _picker.pickImage(source: ImageSource.camera);
    imageFile = await tempStore!.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);
    //final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      pickedImage = File(tempStore.path);
      isAdded = true;
      isFace = false;
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
      isFace = false;
      imageFile = imageFile;
    });
  }

  Future detectFace() async {
    final inputImage = InputImage.fromFile(pickedImage);
    final faceDetector = GoogleMlKit.vision.faceDetector();
    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (rect.isNotEmpty) {
      rect = <Rect>[];
    }
    for (Face face in faces) {
      rect.add(face.boundingBox);
    }
    setState(() {
      isFace = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quantum Model"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isAdded && !isFace
                  ? Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(pickedImage),
                          ),
                        ),
                      ),
                    )
                  : isAdded && isFace
                      ? Center(
                          child: FittedBox(
                            child: SizedBox(
                              width: imageFile.width.toDouble(),
                              height: imageFile.height.toDouble(),
                              child: CustomPaint(
                                painter: FacePainter(
                                  rect: rect,
                                  imageFile: imageFile,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            height: 250,
                            width: 250,
                            color: Colors.grey,
                          ),
                        ),
            ),
            ElevatedButton(
              onPressed: () {
                getImageFromGallery();
              },
              onLongPress: () {
                getImageFromCamera();
              },
              child: const Icon(
                Icons.camera_enhance_rounded,
                size: 30,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          detectFace();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  List<Rect> rect;
  var imageFile;
  FacePainter({required this.rect, @required this.imageFile});

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile != null) {
      canvas.drawImage(imageFile, Offset.zero, Paint());
    }
    for (Rect rectange in rect) {
      canvas.drawRect(
        rectange,
        Paint()
          ..color = Colors.teal
          ..strokeWidth = 6.0
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
