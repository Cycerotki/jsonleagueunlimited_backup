import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:json_league/Pages/camera_page.dart';

import 'package:json_league/Reuse/food_recommendation.dart';

class ShowCalPage extends StatelessWidget {
  final XFile picture;
  final pictureTitle;

  const ShowCalPage(
      {Key? key, required this.picture, required this.pictureTitle})
      : super(key: key);

  // var request =
  // http.MultipartRequest('POST', Uri.parse("http://127.0.0.1:5000"));

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Image.file(
                      File(picture.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black54,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pictureTitle,
                          style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),

                      const SizedBox(height: 4),
                      const Text("Approx. Cals consumed:",
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                      const SizedBox(height: 2),
                      const Text("300 cals",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 20),
                      const Text("Healthier food other people tried:",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      // loop through recommendations
                      Column(
                        children: [
                          FoodRecommendations(
                              foodName: "Guacamole", calories: 200),
                          FoodRecommendations(
                              foodName: "Carrot juice", calories: 39),
                        ],
                      ),

                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        child: Expanded(
                          child: SizedBox(
                            height: 44,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 153, 115),
                              ),
                              onPressed: () async {
                                await availableCameras()
                                    .then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => CameraPage(
                                                  cameras: value,
                                                ))));
                              },
                              child: Text("Let's eat!",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
