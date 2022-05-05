import 'package:chatapp/Model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtomCard extends StatefulWidget {
  String? name;
  IconData? icon;
  ButtomCard({ this.name, this.icon});

  @override

  State<ButtomCard> createState() => _ButtomCardState();
}

class _ButtomCardState extends State<ButtomCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(widget.icon,color: Colors.white,),
        backgroundColor: Colors.indigo,
      ),
      title: Text(
        "${widget.name}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),

      ),

    );
  }
}
