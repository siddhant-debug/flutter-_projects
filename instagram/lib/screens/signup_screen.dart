import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/resources/utils.dart';
import 'package:instagram/screens/desktopscreen.dart';
import 'package:instagram/screens/mobilescreen.dart';
import 'package:instagram/extras/colors.dart';
import 'package:instagram/extras/responsive.dart';
import 'package:instagram/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passController = TextEditingController();
  late final TextEditingController _bioController = TextEditingController();
  late final TextEditingController _usernameController =
      TextEditingController();
  Uint8List? _image;
  bool isAdded = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void getImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
      isAdded = true;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );

    if (res == 'Success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Responsive(
              mobileScreen: MobileScreen(), desktopScreen: DesktopScreen()),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 5,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: isAdded ? MemoryImage(_image!) : null,
                    radius: 50,
                    backgroundColor: Colors.grey[700],
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        child: Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              getImage();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Enter Username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldInput(
                textEditingController: _passController,
                isPass: true,
                hintText: "Enter Password",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: "Enter Bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Sign up'),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: const Text("You all ready have an account?"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
