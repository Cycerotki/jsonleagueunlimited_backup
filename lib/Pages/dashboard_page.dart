import 'package:flutter/material.dart';
import 'package:json_league/Pages/camera_page.dart';
import 'package:json_league/Pages/feed_page.dart';
import 'package:json_league/Pages/dashboard_page.dart';

import 'package:json_league/Reuse/feed_post.dart';
import 'package:json_league/Reuse/nav_bar.dart';
import 'package:camera/camera.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 14, bottom: 8),
                      child: Text(
                        "janedoe",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 14),
                  child: Container(
                    height: 220,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 255, 237, 214),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 216, 168),
                                          // 255, 192, 120
                                          child: Icon(
                                            Icons.whatshot,
                                            color: const Color.fromARGB(
                                                255, 255, 192, 120),
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '20000',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'Kcal burnt',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 211, 249, 216),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 2,
                                            top: 8,
                                            bottom: 8),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color.fromARGB(
                                                255, 178, 242, 187),
                                          ),
                                          child: Icon(
                                            Icons.restaurant,
                                            color: const Color.fromARGB(
                                                255, 105, 219, 124),
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              '2',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              'Healthy meals eaten',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 228, 243, 255),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 2,
                                            top: 8,
                                            bottom: 8),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color.fromARGB(
                                                255, 208, 235, 255),
                                          ),
                                          child: Icon(
                                            Icons.savings,
                                            color: const Color.fromARGB(
                                                255, 116, 192, 252),
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            '200',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            'Tokens earned',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 14, bottom: 8),
                      child: Text(
                        "Your Food",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 6),
                Post(
                  username: 'janedoe',
                  location: 'Los Angeles, CA',
                  image:
                      'https://www.cookingclassy.com/wp-content/uploads/2019/11/best-salad-7.jpg',
                  tags: ['healthy'],
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
