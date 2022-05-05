import 'package:chatapp/CustomUI/custom_card.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/screen/select_contact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key, this.chatmodels,this.sourchat}) : super(key: key);
  final List<ChatModel>? chatmodels;
  final ChatModel? sourchat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
          itemCount: widget.chatmodels!.length,
          itemBuilder: (BuildContext context, index) {
            return CustomCard(chatModel: widget.chatmodels![index],sourchat: widget.sourchat,);
          }),
    );
  }
}
