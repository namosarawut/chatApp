import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatapp/screen/camera_view.dart';
import 'package:chatapp/screen/video_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  String fromhome;

  CameraScreen({required this.fromhome});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameraValue;
  var image;
  var video;
  bool isRecording = false;
  bool flashOn = false;
  bool cameraIsfront = true;


  Future<void> tackVdieo(BuildContext context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, "${DateTime.now()}.mp4");
      await cameraValue;
      var i = await _cameraController!.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    } on CameraException catch (e) {
      print(e);
    }
  }

  Route _createRouteVdieo(XFile vdieoFile) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          VideoViewScreen(vdieoFile: vdieoFile),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    try {
      await cameraValue;
      image = await _cameraController!.takePicture();
      await Navigator.of(context).push(_createRoute());
    } catch (e) {
      print(e);
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CameraView(
        imagePath: image.path,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_cameraController!));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        Visibility(
          visible: widget.fromhome == "1" ? false : true,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios,
                        size: 40, color: Colors.white)),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Column(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          flashOn = !flashOn;
                          flashOn
                              ? _cameraController!.setFlashMode(FlashMode.torch)
                              : _cameraController!.setFlashMode(FlashMode.off);
                        });
                      },
                      icon: flashOn == false
                          ? Icon(Icons.flash_off, size: 40, color: Colors.white)
                          : Icon(Icons.flash_on, size: 40, color: Colors.white),
                    ),
                    GestureDetector(
                      onLongPress: () {
                        tackVdieo(context);
                      },
                      onLongPressUp: () async {
                        var i = await _cameraController!.stopVideoRecording();
                        print("${i.name}");
                        setState(() {
                          isRecording = false;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VideoViewScreen(vdieoFile: i)));
                        // _createRouteVdieo(i);
                      },
                      onTap: () {
                        takePhoto(context);
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            isRecording == false ? Colors.blue : Colors.white,
                        child: isRecording == false
                            ? Icon(Icons.panorama_fish_eye,
                                size: 70, color: Colors.white)
                            : Icon(Icons.radio_button_on,
                                size: 70, color: Colors.red),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            cameraIsfront = !cameraIsfront;
                          });
                          int camPos = cameraIsfront ? 0 : 1;
                          _cameraController = CameraController(
                              cameras![camPos], ResolutionPreset.high);
                          cameraValue = _cameraController!.initialize();
                        },
                        icon: Icon(Icons.flip_camera_ios,
                            size: 40, color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "กดค้างเพื่อถ่าย วีดีโอ กดครั้งเดียวเพื่อถ่ายรูป",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
