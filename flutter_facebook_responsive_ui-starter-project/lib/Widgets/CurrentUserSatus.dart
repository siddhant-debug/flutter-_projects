//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/Widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';

class CurrentUserStatus extends StatelessWidget {
  final User currentUser;

  const CurrentUserStatus({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(
                imageUrl: currentUser.imageUrl,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind ?',
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Live',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text(
                    'Photo',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const VerticalDivider(
                  width: 8.0,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text(
                    'Room',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
