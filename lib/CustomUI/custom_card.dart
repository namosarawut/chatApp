import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/screen/indiviualPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatefulWidget {
  final ChatModel? chatModel;
  final ChatModel? sourchat;

  CustomCard({Key? key, this.chatModel, this.sourchat}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: widget.chatModel!,
                      sourchat: widget.sourchat,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                widget.chatModel!.isGroup == true
                    ? "assets/group.svg"
                    : "assets/person.svg",
                color: Colors.white,
                height: 38,
                width: 38,
              ),
            ),
            title: Text(
              "${widget.chatModel!.name}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Text("${widget.chatModel!.currentMessage}"),
              ],
            ),
            trailing: Text("${widget.chatModel!.time}"),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
