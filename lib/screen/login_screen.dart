import 'package:chatapp/CustomUI/buttom_card.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/screen/home_scren.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourcChat;
  List<ChatModel> chat = [
    ChatModel(
      id: 1,
      name: "Loki San",
      icon: "assets/person.svg",
      isGroup: false,
      time: "04:00",
      currentMessage: "Hi!! Thor",
    ),
    ChatModel(
        id: 2,
        name: "Asgardian",
        icon: "assets/group.svg",
        isGroup: true,
        time: "05:00",
        currentMessage: "What'Up")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chat.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
                onTap: () {
                  sourcChat = chat.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => HomeScreen(
                                chatmodels: chat,
                                sourchat: sourcChat,
                              )));
                },
                child: ButtomCard(
                  name: "${chat[index].name}",
                  icon: Icons.person,
                ));
          }),
    );
  }
}
