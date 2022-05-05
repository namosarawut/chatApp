import 'package:chatapp/Model/message_model.dart';
import 'package:flutter/material.dart';

class OwnMessageCard extends StatefulWidget {
  MessageModel? messages;
   OwnMessageCard({Key? key, this.messages}) : super(key: key);

  @override
  State<OwnMessageCard> createState() => _OwnMessageCardState();
}

class _OwnMessageCardState extends State<OwnMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.indigo,
          child: Stack(
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                  child: Text(
                    "${widget.messages!.message}",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  )),
              Positioned(

                bottom: 2,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      "${widget.messages!.time}",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(width: 5,),
                    Icon(
                      Icons.done_all,
                      size: 20,
                        color: Colors.white
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
