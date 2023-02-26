import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:json_league/Pages/show_cal_page.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({Key? key, required this.picture, required this.pictureTitle})
      : super(key: key);

  final XFile picture;
  final pictureTitle;
  // final Uint8List img_bytes;

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  final foodNameChangeController = TextEditingController();
  final locationController = TextEditingController();

  final db = FirebaseFirestore.instance;

  @override
  void dispose() {
    foodNameChangeController.dispose();
    locationController.dispose();
    super.dispose();
  }

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
                      File(widget.picture.path),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.pictureTitle != "Service Unavailable")
                        Text(
                            "Are you eating " +
                                widget.pictureTitle[0].toUpperCase() +
                                widget.pictureTitle.substring(1) +
                                " ?",
                            style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      if (widget.pictureTitle != "Service Unavailable")
                        const SizedBox(height: 4),
                      if (widget.pictureTitle != "Service Unavailable")
                        const Text(
                            "If not, enter the name of the food you've just gobbled.",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      if (widget.pictureTitle == "Service Unavailable")
                        Text("We couldn't identify image.",
                            style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      if (widget.pictureTitle == "Service Unavailable")
                        const SizedBox(height: 4),
                      if (widget.pictureTitle == "Service Unavailable")
                        Text("Please let us know what you're eating",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white)),
                      const SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Nom nom',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                        controller: foodNameChangeController,
                      ),
                      const SizedBox(height: 14),
                      const Text("Location",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Earth',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                        controller: locationController,
                      ),
                      const SizedBox(height: 14),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowCalPage(
                                            picture: widget.picture,
                                            pictureTitle:
                                                foodNameChangeController.text ==
                                                        ""
                                                    ? widget.pictureTitle[0]
                                                            .toUpperCase() +
                                                        widget.pictureTitle
                                                            .substring(1)
                                                    : foodNameChangeController
                                                        .text,
                                          )),
                                  // send location as well here
                                  // db.collection("users")
                                );
                              },
                              child: Text('Submit',
                                  style: const TextStyle(
                                      fontSize: 18,
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
