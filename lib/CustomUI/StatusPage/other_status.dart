import 'package:flutter/material.dart';

class OthersStatus extends StatelessWidget {
  final String? name;
  final String? time;
  final String? imgpath;
   OthersStatus({Key? key,this.name,this.time,this.imgpath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: AssetImage("${imgpath}"),
      ),
      title: Text(
        "${name}",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),

      ),
      subtitle: Text(
        "Today at, ${time}",
        style: TextStyle(fontSize: 14,color: Colors.grey[900]),

      ),
    );
  }
}
