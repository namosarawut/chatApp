import 'package:chatapp/CustomUI/own_file_card.dart';
import 'package:chatapp/CustomUI/own_message_card.dart';
import 'package:chatapp/CustomUI/reply_file_card.dart';
import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Model/message_model.dart';
import 'package:chatapp/screen/camera_screen.dart';
import 'package:chatapp/screen/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../CustomUI/reply_card.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  final ChatModel? chatModel;

  final ChatModel? sourchat;

  IndividualPage({Key? key, this.chatModel, this.sourchat}) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  IO.Socket? socket;
  bool sendButton = false;
  bool show = false;
  List<MessageModel> messages = [];
  TextEditingController messageController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  ImagePicker _picker = ImagePicker();
  XFile? file;

  void connect() async {
    // https://morning-shore-23134.herokuapp.com/check
    socket = await IO.io("http://192.168.1.30:5500", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    await socket!.connect();
    socket!.emit("/signin", "${widget.sourchat!.id}");
    socket!.onConnect((data) {
      print("Connected!!");
      socket!.on(
          "message",
          (msg) => {
                print("Data ${msg}"),
                setMessage("destination", msg["message"], msg["path"])
              });
    });
    print("Connected : ${socket!.connected}");
  }

  void sendMessage(String message, int sourceID, int targetID, String path) {
    setMessage("source", message, path);
    socket!.emit(
      "message",
      {
        "message": message,
        "sourceid": sourceID,
        "targetid": targetID,
        "path": path
      },
    );
  }

  void setMessage(String type, String message, String path) {
    MessageModel messageModel = MessageModel(
        path: path,
        type: type,
        message: message,
        time: "${DateTime.now().toString().substring(10, 16)}");
    setState(() {
      messages.add(messageModel);
    });
    print(messages.length);
    if (messages.length <= 4) {
    } else {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 50,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 100), curve: Curves.easeOut);
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          leadingWidth: 70,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blueGrey,
                  child: SvgPicture.asset(
                    widget.chatModel!.isGroup == true
                        ? "assets/group.svg"
                        : "assets/person.svg",
                    color: Colors.white,
                    height: 26,
                    width: 26,
                  ),
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.chatModel!.name}"),
                  Text(
                    "last seen today at 10:00",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.videocam_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
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
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          return OwnMessageCard(messages: messages[index]);
                        } else {
                          return ReplyCard(messages: messages[index]);
                        }
                      }),
                  // child: ListView(
                  //   children: [
                  //     OwnFilCard(),
                  //     OwnReplyFileCard(),
                  //     SizedBox(
                  //       height: 60,
                  //     )
                  //   ],
                  // ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.82,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: messageController,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        sendButton = true;
                                      });
                                    } else {
                                      setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type a massege",
                                      prefixIcon: IconButton(
                                        icon:
                                            Icon(Icons.emoji_emotions_outlined),
                                        onPressed: () {},
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomsheet());
                                              },
                                              icon: Icon(Icons.attach_file)),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CameraScreen(
                                                              fromhome: "0",
                                                            )));
                                              },
                                              icon: Icon(Icons.camera_alt))
                                        ],
                                      )),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: 8, left: 2, right: 5),
                                child: CircleAvatar(
                                  radius: 25,
                                  child: IconButton(
                                    onPressed: () {
                                      if (sendButton) {
                                        sendMessage(
                                            messageController.text.toString(),
                                            int.parse("${widget.sourchat!.id}"),
                                            int.parse(
                                                "${widget.chatModel!.id}"),
                                            "TestPath");
                                        messageController.clear();

                                        setState(() {
                                          sendButton = false;
                                        });
                                      } else {}
                                    },
                                    icon: sendButton
                                        ? Icon(Icons.send)
                                        : Icon(Icons.mic),
                                  ),
                                ))
                          ],
                        ),
                        // emojiSelect()
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcretion(Icons.insert_drive_file, Colors.indigo,
                      "Document", () {}),
                  SizedBox(
                    width: 40,
                  ),
                  // InkWell(
                  iconcretion(Icons.camera_alt, Colors.pink, "camera", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CameraScreen(
                                  fromhome: "0",
                                )));
                  }),
                  SizedBox(
                    width: 40,
                  ),
                  iconcretion(Icons.photo, Colors.blue, "Gallery", () async {
                    file = await _picker.pickImage(source: ImageSource.gallery);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                CameraView(imagePath: file!.path)));
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcretion(
                      Icons.insert_drive_file, Colors.orange, "Audio", () {}),
                  SizedBox(
                    width: 40,
                  ),
                  iconcretion(
                      Icons.location_pin, Colors.blue, "Location", () {}),
                  SizedBox(
                    width: 40,
                  ),
                  iconcretion(Icons.person, Colors.blue, "Contact", () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcretion(
    IconData icon,
    Color color,
    String title,
    Function() ontap,
  ) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              color: Colors.white,
              size: 29,
            ),
          ),
          Text("$title")
        ],
      ),
    );
  }
//
// Widget buildSticker() {
//   return EmojiPicker(
//     rows: 3,
//     columns: 7,
//     buttonMode: ButtonMode.MATERIAL,
//     recommendKeywords: ["racing", "horse"],
//     numRecommended: 10,
//     onEmojiSelected: (emoji, category) {
//       print(emoji);
//     },
//   );
// }
}
