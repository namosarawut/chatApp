import 'dart:io';

import 'package:flutter/material.dart';

class OwnFilCard extends StatelessWidget {
  final String? path;

  const OwnFilCard({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.3,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.indigo[300],
          ),
          child: Card(
            margin: EdgeInsets.all(3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Image.file(File(path!)),
          ),
        ),
      ),
    );
  }
}
