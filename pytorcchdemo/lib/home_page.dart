import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    setState(() {
      pickedImage = File(tempStore.path);
      isAdded = true;
      isFace = false;
      imageFile = imageFile;
    });
  }

  Future detectFace() async {
    final inputImage = InputImage.fromFile(pickedImage);
    final faceDetector = GoogleMlKit.vision.faceDetector(
      const FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
        enableContours: true,
        enableTracking: true,
        mode: FaceDetectorMode.accurate,
      ),
    );

    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (rect.isNotEmpty) {
      rect = <Rect>[];
    }
    for (Face face in faces) {
      rect.add(face.boundingBox);
      print(face.boundingBox);
    }
    setState(() {
      isFace = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pytorch demo"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: detectFace,
          child: const Icon(Icons.done),
        ),
        body: Column(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: isAdded && !isFace
                      ? Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(pickedImage),
                            ),
                          ),
                        )
                      : isAdded && isFace
                          ? FittedBox(
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.matrix([
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
                          : Container(
                              height: 300,
                              width: 300,
                              color: Colors.grey,
                            ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: getImageFromGallery,
                      icon: const Icon(Icons.photo),
                      label: const Text("Gallery"),
                    ),
                    ElevatedButton.icon(
                      onPressed: getImageFromCamera,
                      icon: const Icon(Icons.camera),
                      label: const Text("Camera"),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 20,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isAdded = false;
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
