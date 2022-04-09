import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rock Paper Scissors"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 80,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage("assets/images/paper_btn.png"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage("assets/images/rock_btn.png"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {},
                child: const Image(
                  image: AssetImage("assets/images/scisor_btn.png"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                width: 200,
                child: const Card(
                  child: Center(
                    child: Text(
                      "0:0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.5,
                      offset: Offset(0, 6),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
