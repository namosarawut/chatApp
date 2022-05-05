import 'package:chatapp/Model/ChatModel.dart';
import 'package:chatapp/Page/cameraPage.dart';
import 'package:chatapp/Page/chat_page.dart';
import 'package:chatapp/Page/status_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,this.chatmodels,this.sourchat}) : super(key: key);
  final List<ChatModel>? chatmodels;
  final ChatModel? sourchat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabcontroler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabcontroler = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App นี้ดีกว่า Facebook"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
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
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _tabcontroler,
            tabs: [
              // Tab(icon: Icon(Icons.camera_alt)),
              Tab(
                text: "แชท",
              ),
              Tab(
                text: "สถานะ",
              ),
              Tab(
                text: "โทร",
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabcontroler,
          children: [
            // CameraPage(fromhome:"1"),
            ChatPage(chatmodels:widget.chatmodels,sourchat: widget.sourchat,),
            StatusPage(),
            Text("Calls"),
          ],
        ));
  }
}
