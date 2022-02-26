import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/contact_list.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  //web profile bar
                  //web search bar
                  ContactList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgroundImage.png",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
