import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:pytorch_mobile/model.dart';
import 'package:pytorch_mobile/pytorch_mobile.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Processed Image',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white60,
      ),
      home: const MyHomePage(
        title: 'Show Processed Image',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? documentPath;
  bool _showProcessed = false;
  img.Image? _image;
  ui.Image? _uiImage;
  final ImagePicker _picker = ImagePicker();
  Model? _imageModel;
  String? _imagePrediction;

  Future loadModel() async {
    String pathImageModel = "assets/models/nmodel.pt";
    try {
      _imageModel = await PyTorchMobile.loadModel(pathImageModel);
    } on PlatformException {
      print("only supported for android and ios so far");
    }
  }

  Future<void> loadImage() async {
    ByteData data = await rootBundle.load('assets/images/bill_gates.jpg');
    _image = img.decodeImage(data.buffer.asUint8List());
  }

  //
  // Future loadModel() async {
  //   String pathImageModel = "assets/models/qmodel.pt";
  //   try {
  //     _imageModel = await PyTorchMobile.loadModel(pathImageModel);
  //   } on PlatformException {
  //     print("only supported for android and ios so far");
  //   }
  // }

  img.Image processImage(img.Image image) {
    image = img.grayscale(image);
    image = img.copyResize(
      image,
      height: 48,
      width: 48,
    );
    return image;
  }

  Future<ui.Image> imgImageToUiImage(img.Image image) async {
    ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
        image.getBytes(format: img.Format.rgba));
    ui.ImageDescriptor id = ui.ImageDescriptor.raw(buffer,
        height: image.height,
        width: image.width,
        pixelFormat: ui.PixelFormat.rgba8888);
    ui.Codec codec = await id.instantiateCodec(
        targetHeight: image.height, targetWidth: image.width);
    ui.FrameInfo fi = await codec.getNextFrame();
    ui.Image uiImage = fi.image;
    return uiImage;
  }

  Future<void> _getPredict() async {
    final ByteData imageData =
        await rootBundle.load('assets/images/bill_gates.jpg');
    var myImage = imageData.buffer.asUint8List();

    try {
      final String? results = await _imageModel?.getImagePrediction(
          File.fromRawPath(myImage), 48, 48, "assets/labels.txt");
      setState(() {
        _imagePrediction = results;
        _showProcessed = true;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // Future runImageModel() async {
  //   _imagePrediction = await _imageModel?.getImagePrediction(
  //     _uiImage,
  //     48,
  //     48,
  //   );
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();
    loadImage().then((value) {
      if (_image != null) {
        _image = processImage(_image!);
        imgImageToUiImage(_image!).then((value) {
          _uiImage = value;
          loadModel();
        });
      } else {
        print("error");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _showProcessed
            ? Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: _uiImage?.height.toDouble(),
                      width: _uiImage?.width.toDouble(),
                      child: RawImage(image: _uiImage),
                    ),
                  ),
                  Text(
                    (_imagePrediction ?? '').toUpperCase(),
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              )
            : Image.asset('assets/images/bill_gates.jpg'),
      ),
      floatingActionButton: FabCircularMenu(
        animationCurve: Curves.easeIn,
        ringDiameter: 300,
        ringWidth: 60,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (_showProcessed == false) {
                    _showProcessed = true;
                  } else {
                    _showProcessed = false;
                  }
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              //getImageFromCamera();
            },
            icon: const Icon(Icons.camera_alt),
          ),
          IconButton(
            onPressed: () {
              //getImageFromGallery();
            },
            icon: const Icon(Icons.photo_library_sharp),
          ),
          IconButton(
            onPressed: () {
              _getPredict();
            },
            tooltip: 'Predict Image',
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              setState(
                () {
                  _showProcessed = false;
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
