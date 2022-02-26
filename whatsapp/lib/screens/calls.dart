import 'package:flutter/material.dart';
import 'package:whatsapp/utils/info.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: info.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                trailing: const Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.green,
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    info[index]['profilePic'].toString(),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info[index]['name'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_callback_outlined,
                          color: Colors.green,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          info[index]['time'].toString(),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
