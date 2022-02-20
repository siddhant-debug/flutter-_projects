import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class MyMood extends StatefulWidget {
  const MyMood({Key? key}) : super(key: key);

  @override
  _MyMoodState createState() => _MyMoodState();
}

class _MyMoodState extends State<MyMood> {
  String pathOfImage = " ";
  String moodImagePath = "";
  String moodDetail = "";
  bool isVisible = false;

  FaceDetector detector = GoogleMlKit.vision.faceDetector(
    const FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
      enableContours: true,
      enableTracking: true,
    ),
  );

  void pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pathOfImage = image!.path;
    });
  }

  void extractData(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    List<Face> faces = await detector.processImage(inputImage);

    if (faces.isNotEmpty && faces[0].smilingProbability != null) {
      double? prob = faces[0].smilingProbability;

      if (prob! > 0.8) {
        setState(() {
          moodDetail = "Happy";
          moodImagePath = "assets/happy.png";
        });
      } else if (prob > 0.3 && prob < 0.8) {
        setState(() {
          moodDetail = "Normal";
          moodImagePath = "assets/meh.png";
        });
      } else if (prob > 0.06152385 && prob < 0.3) {
        setState(() {
          moodDetail = "Sad";
          moodImagePath = "assets/sad.png";
        });
      } else {
        setState(() {
          moodDetail = "Angry";
          moodImagePath = "assets/angry.png";
        });
      }
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          visible: isVisible,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(
              moodImagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Text(
            "Your Girlfriend Mood is $moodDetail",
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 30,
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () async {
              pickImage();
              Future.delayed(const Duration(seconds: 7), () {
                extractData(pathOfImage);
              });
            },
            child: const Text(
              "Pick Image",
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 30,
              ),
            ),
          ),
        )
      ],
    ));
  }
}
