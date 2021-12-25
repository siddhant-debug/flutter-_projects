import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_responsive_ui/Widgets/CurrentUserSatus.dart';
import 'package:flutter_facebook_responsive_ui/Widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/Widgets/room.dart';
import 'package:flutter_facebook_responsive_ui/Widgets/stories.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
                fontSize: 28.0,
              ),
            ),
            actions: [
              CircleButton(
                onPress: () {},
                icon: Icon(Icons.search),
              ),
              CircleButton(
                onPress: () {},
                icon: Icon(MdiIcons.facebookMessenger),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CurrentUserStatus(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
        ],
      ),
    );
  }
}
