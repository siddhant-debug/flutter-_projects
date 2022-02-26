import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  final ImagePicker _picker = ImagePicker();
  late File pickedImage;
  late bool isAdded = false;
  var imageFile;
  // Pick an image

  // Capture a photo
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  getImageFromGallery() async {
    var tempStore = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = await tempStore!.readAsBytes();
    imageFile = await decodeImageFromList(imageFile);
    //final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      pickedImage = File(tempStore.path);
      isAdded = true;
      imageFile = imageFile;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: isAdded ? FileImage(pickedImage) : null,
                    radius: 50,
                    backgroundColor: Colors.grey[700],
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            getImageFromGallery();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Enter Username",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "Enter Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: _passController,
                isPass: true,
                hintText: "Enter Password",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: _passController,
                isPass: true,
                hintText: "Confirm Password",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: "Enter Bio",
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  child: const Text('Sign up'),
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
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
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
