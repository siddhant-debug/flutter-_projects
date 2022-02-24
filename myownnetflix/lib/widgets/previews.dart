import 'package:flutter/material.dart';
import 'package:myownnetflix/models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  const Previews({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 165.0,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              final Content content = contentList[index];
              return GestureDetector(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 133.0,
                      width: 133.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: content.color,
                          width: 4.0,
                        ),
                        color: Colors.teal,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 133.0,
                      width: 133.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: content.color,
                          width: 4.0,
                        ),
                        color: Colors.teal,
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(colors: [
                          Colors.black87,
                          Colors.black45,
                          Colors.transparent,
                        ]),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Image(
                        image: AssetImage(
                          content.titleImageUrl,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
