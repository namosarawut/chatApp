import 'package:chatapp/CustomUI/StatusPage/HeadOwnStatus.dart';
import 'package:chatapp/CustomUI/StatusPage/other_status.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              backgroundColor: Colors.indigo,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            child: FloatingActionButton(
              elevation: 5,
              onPressed: () {},
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            HeadOwnStatus(),
            Buildlabel(context,"Recent Update"),
            OthersStatus(name: "Sarawut 616",time: "01:13",imgpath: "assets/profile1.jpg",),
            OthersStatus(name: "Sarawut 838",time: "02:23",imgpath: "assets/profile2.jpg",),
            OthersStatus(name: "Sarawut 777",time: "03:33",imgpath: "assets/profile3.jpg",),
            SizedBox(
              height: 10,
            ),
            Buildlabel(context,"Viewed Update"),

            OthersStatus(name: "Sarawut 123",time: "04:11",imgpath: "assets/profile4.jpg",),
          ],
        ),
      ),
    );
  }

  Container Buildlabel(BuildContext context, String label) {
    return Container(
            height: 33,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13,vertical: 7),
              child: Text(
                "${label}",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ),
          );
  }
}
