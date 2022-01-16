import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_to_text/home_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: Colors.white,
      duration: 2500,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      imageSize: 200,
      imageSrc: "assets/mlmodel.png",
      text: "ML Model",
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      textType: TextType.ScaleAnimatedText,
      navigateRoute: const HomePage(),
    );
  }
}
