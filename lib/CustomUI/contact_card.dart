import 'package:chatapp/Model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatefulWidget {
  ContactModel contact;

  ContactCard({required this.contact});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              backgroundColor: Colors.lightBlue,
            ),
           widget.contact.isselect  == true ? Positioned(
              bottom: 4,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ) : Container()
          ],
        ),
      ),
      title: Text(
        "${widget.contact.name}",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        "${widget.contact.status}",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
