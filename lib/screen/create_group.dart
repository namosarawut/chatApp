import 'package:chatapp/CustomUI/avatar_card.dart';
import 'package:chatapp/CustomUI/buttom_card.dart';
import 'package:chatapp/CustomUI/contact_card.dart';
import 'package:chatapp/Model/contact_model.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ContactModel> contact = [
    ContactModel(name: "Loki San", status: "A full stack developer"),
    ContactModel(name: "Tony Stack", status: "Technical"),
    ContactModel(name: "Natasha Romanoft", status: "IOS Developer"),
    ContactModel(name: "Blusher Devid", status: "Text Developer"),
    ContactModel(name: "Namo Sarawut", status: "Flutter Developer")
  ];
  List<ContactModel> grouplist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
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
        body: Column(
          children: [
            Visibility(
              visible: grouplist.isEmpty ? false : true,
              child: Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contact.length,
                        itemBuilder: (BuildContext context, index) {
                          if(contact[index].isselect == true){
                            return InkWell(onTap:(){
                              setState(() {
                                grouplist.remove(contact[index]);
                                contact[index].isselect = false;
                                // print(contact[index].isselect);
                              });
                            },child: AvatarCard(grouplist:contact[index]));
                          }
                          return Container();
                        }),
                  ),
                  Divider(
                    thickness: 1,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: contact.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                        onTap: () {
                          if (contact[index].isselect == false ||
                              contact[index].isselect == null) {
                            setState(() {
                              contact[index].isselect = true;
                              grouplist.add(contact[index]);
                              // print(contact[index].isselect);
                            });
                          } else {
                            setState(() {
                              contact[index].isselect = false;
                              grouplist.remove(contact[index]);
                              // print(contact[index].isselect);
                            });
                          }
                        },
                        child: ContactCard(contact: contact[index]));
                  }),
            ),

          ],
        ));
  }
}
