import 'package:flutter/material.dart';
import 'package:whatsapp/utils/info.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/8/85/Elon_Musk_Royal_Society_%28crop1%29.jpg',
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 10,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "My Status",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Tap to add Status update",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
          child: Text(
            'Recent Updates',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 29,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info[1]['name'].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    info[1]['time'].toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
