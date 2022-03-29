import 'dart:io';
import 'dart:async';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreenView(
        navigateRoute: const MyHomePage(),
        backgroundColor: Colors.teal,
        duration: 3000,
        imageSrc: "assets/logo.png",
        text: "Face Detection",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 40.0,
        ),
        colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late File pickedImage;
  var imageFile;
  List<Rect> rect = <Rect>[];
  String moodImagePath = "";
  String moodDetail = "";
  late bool isAdded = false;
  late bool isFace = false;
  final ImagePicker _picker = ImagePicker();

  pickImage(ImageSource source) async {
    var tempStore = await _picker.pickImage(source: source);
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

  Future detectFace() async {
    final inputImage = InputImage.fromFile(pickedImage);
    final faceDetector = GoogleMlKit.vision.faceDetector(
      const FaceDetectorOptions(
        enableClassification: true,
        enableLandmarks: true,
        enableContours: true,
        enableTracking: true,
      ),
    );

    final List<Face> faces = await faceDetector.processImage(inputImage);
    if (rect.isNotEmpty) {
      rect = <Rect>[];
    }
    for (Face face in faces) {
      rect.add(face.boundingBox);
    }
    if (faces.isNotEmpty && faces[0].smilingProbability != null) {
      double? prob = faces[0].smilingProbability;
      if (prob! > 0.2) {
        setState(() {
          moodDetail = "happy";
        });
      } else {
        setState(() {
          moodDetail = "Neutral";
        });
      }
    }
    setState(() {
      isFace = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Quantum Machine Learning and Classical Machine Learning "),
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
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              child: SizedBox(
                                width: imageFile.width.toDouble(),
                                height: imageFile.height.toDouble(),
                                child: ColorFiltered(
                                  colorFilter:
                                      const ColorFilter.matrix(<double>[
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
                                  // child: CustomPaint(
                                  //   painter: FacePainter(
                                  //     rect: rect,
                                  //     imageFile: imageFile,
                                  //   ),
                                  // ),
                                  child: Image(
                                    image: ResizeImage(
                                      FileImage(pickedImage),
                                      height: 48,
                                      width: 48,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "your mood is $moodDetail".toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        )
                      : Center(
                          child: Container(
                            height: 250,
                            width: 250,
                            color: Colors.grey,
                          ),
                        ),
            ),
          ],
        ),
      ),
      floatingActionButton: FabCircularMenu(
        animationCurve: Curves.bounceIn,
        alignment: Alignment.bottomLeft,
        ringWidth: 60,
        ringDiameter: 250,
        children: [
          IconButton(
            onPressed: () {
              pickImage(ImageSource.camera);
            },
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {
              pickImage(ImageSource.gallery);
            },
            icon: const Icon(Icons.photo_library_sharp),
          ),
          IconButton(
            onPressed: () {
              detectFace();
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
