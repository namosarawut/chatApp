import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  String imagePath;

  CameraView({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                File(imagePath),
                fit: BoxFit.fill,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        )),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.crop_rotate,
                              color: Colors.white,
                              size: 40,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.white,
                              size: 40,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.title,
                              color: Colors.white,
                              size: 40,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 40,
                            )),
                      ],
                    ),
                  ],
                )),
            Positioned(
                bottom: 0.0,
                child: Container(
                  color: Colors.black38,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: TextFormField(
                    style:TextStyle(color: Colors.white, fontSize: 17),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add Caption....",
                        prefixIcon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 27,
                        ),
                        suffixIcon: CircleAvatar(
                          radius: 27,
                          child: Icon(Icons.check,size: 27,),
                        ),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 17)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget bottomsheet(BuildContext context) {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.multiline,
                  maxLines: 9,
                  minLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Add Caption...",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
