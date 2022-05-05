import 'package:chatapp/CustomUI/buttom_card.dart';
import 'package:chatapp/CustomUI/contact_card.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/contact_model.dart';
import 'package:chatapp/screen/create_group.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ContactModel> contact = [
    ContactModel(name: "Loki San", status: "A full stack developer"),
    ContactModel(name: "Tony Stack", status: "Technical"),
    ContactModel(name: "Natasha Romanoft", status: "IOS Developer"),
    ContactModel(name: "Blusher Devid", status: "Text Developer"),
    ContactModel(name: "Namo Sarawut", status: "Flutter Developer")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SelectContact",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "Contact",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("New Group"),
                  value: "New Group",
                ),
                PopupMenuItem(
                  child: Text("New brodcast"),
                  value: "New brodcast",
                ),
                PopupMenuItem(
                  child: Text("Whatapp Web"),
                  value: "Whatapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred Messages"),
                  value: "Starred Messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contact.length + 2,
            itemBuilder: (BuildContext context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup()));
                    print("0999");
                  },
                  child: ButtomCard(
                    icon: Icons.group,
                    name: "New Group",
                  ),
                );
              } else if (index == 1) {
                return ButtomCard(
                  icon: Icons.person_add,
                  name: "New Contact",
                );
              } else {
                return ContactCard(contact: contact[index - 2]);
              }
            }));
  }
}
