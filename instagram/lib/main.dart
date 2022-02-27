import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/desktopscreen.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/mobilescreen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/responsive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyAQ6yPCHVwCn16U1E-xO2uwFT6mqvK8uWg",
      authDomain: "instagram-clone-1635e.firebaseapp.com",
      projectId: "instagram-clone-1635e",
      storageBucket: "instagram-clone-1635e.appspot.com",
      messagingSenderId: "885633625327",
      appId: "1:885633625327:web:a9bbca19c93c004a897f1a",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const Responsive(
                mobileScreen: MobileScreen(),
                desktopScreen: DesktopScreen(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
