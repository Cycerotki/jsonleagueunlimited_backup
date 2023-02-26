import 'package:flutter/material.dart';
import 'package:json_league/Pages/camera_page.dart';
import 'package:json_league/Reuse/feed_post.dart';
import 'package:json_league/Pages/dashboard_page.dart';

import 'package:json_league/Reuse/nav_bar.dart';
import 'package:camera/camera.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 14, bottom: 8),
                  child: Text(
                    "Your Feed",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Post(
                  username: 'janedoe',
                  location: 'Los Angeles, CA',
                  image:
                      'https://www.cookingclassy.com/wp-content/uploads/2019/11/best-salad-7.jpg',
                  tags: ['healthy'],
                ),
                Post(
                  username: 'perygrey',
                  location: 'New York, NY',
                  image:
                      'https://www.thespruceeats.com/thmb/NwrWtNVna9yvS6aqH-MAn19Znuw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/basic-baked-chicken-breasts-3050929-hero-01-c2b17bf655c24182a30a201c212ccde0.jpg',
                  tags: ['healthy', 'meat'],
                ),
                Post(
                  username: 'janedoe',
                  location: 'Los Angeles, CA',
                  image:
                      'https://i2.wp.com/www.melaniecooks.com/wp-content/uploads/2011/10/white-fish-recipe.jpg',
                  tags: ['pescatarian', 'healthy'],
                ),
              ],
            ),
          ),
          CustomNavbar(
            onFeedPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Feed()),
              );
            },
            onCameraPressed: () async {
              await availableCameras().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CameraPage(
                            cameras: value,
                          ))));
            },
            onDashboardPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
        ]),
      ),
    );
  }
}
