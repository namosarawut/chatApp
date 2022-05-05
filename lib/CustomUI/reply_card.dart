import 'package:chatapp/Model/message_model.dart';
import 'package:flutter/material.dart';

class ReplyCard extends StatefulWidget {
  MessageModel? messages;
   ReplyCard({Key? key, this.messages}) : super(key: key);

  @override
  State<ReplyCard> createState() => _ReplyCardState();
}

class _ReplyCardState extends State<ReplyCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                  padding:
                  EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                  child: Text(
                    "${widget.messages!.message}",
                    style: TextStyle(fontSize: 16),
                  )),
              Positioned(
                bottom: 4,
                right: 10,
                child:Text(
                  "${widget.messages!.time}",
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
