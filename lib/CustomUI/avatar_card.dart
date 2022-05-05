import 'package:chatapp/Model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarCard extends StatelessWidget {
  ContactModel grouplist;
  AvatarCard({required this.grouplist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
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
              grouplist.isselect  == true ? Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ) : Container()
            ],
          ),
          SizedBox(height: 2,),
          Text("${grouplist.name}",style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}
