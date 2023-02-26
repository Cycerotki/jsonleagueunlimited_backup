import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_league/Pages/dashboard_page.dart';
import 'package:json_league/Pages/feed_page.dart';
import 'package:json_league/Pages/preview_page.dart';
import "package:http/http.dart" as http;

import 'package:json_league/Reuse/nav_bar.dart';

class CameraPage extends StatefulWidget {
  final cameras;

  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    try {
      await _cameraController.initialize().then(
        (value) {
          if (!mounted) return;
          setState(() {});
        },
      );
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }

    if (_cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      // await _cameraController.setFlashMode(FlashMode.auto);
      XFile picture = await _cameraController.takePicture();
      final img_bytes = await File(picture.path).readAsBytes();

      // await http.post(Uri.parse("http://192.168.137.1:5000"));

      var request = http.MultipartRequest("POST",
          Uri.parse("https://flask-deploy-asia-xjmano4stq-as.a.run.app"));
      File filePic = File(picture.path);
      var pic = await http.MultipartFile.fromPath("image", filePic.path);
      request.files.add(pic);
      var response = await request.send();
      final stringResponse = await utf8.decoder.bind(response.stream).join();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                    picture: picture,
                    // img_bytes: img_bytes,
                    pictureTitle: stringResponse,
                  )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cameraController.dispose();
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
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: _cameraController.value.isInitialized
                      ? CameraPreview(_cameraController)
                      : const Center(child: CircularProgressIndicator()),
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
                  await takePicture();
                },
                onDashboardPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
