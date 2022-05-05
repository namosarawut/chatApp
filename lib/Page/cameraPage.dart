import 'package:chatapp/screen/camera_screen.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  String fromhome;
  CameraPage({required this.fromhome});

  @override
  Widget build(BuildContext context) {
    return CameraScreen(fromhome:"${fromhome}");
  }
}
