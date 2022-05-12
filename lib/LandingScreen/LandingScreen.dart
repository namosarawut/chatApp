import 'package:chatapp/LandingScreen/login_page.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to MyChatApp",
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 29,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 8,
              ),
              Image.asset(
                "assets/bg.png",
                color: Colors.indigo,
                height: 340,
                width: 340,
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 7.5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                            text: "Agree and Contine to accept the",
                            style: TextStyle(color: Colors.grey[600])),
                        TextSpan(
                            text:
                            " MyChatApp Terms of Service and Privacy Policy",
                            style: TextStyle(color: Colors.cyan))
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (builder) => LoginPage()), (
                          route) => false);
                },
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 110,
                  height: 50,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: Colors.indigo,
                    child: Center(
                      child: Text(
                        "AGREE AND CONTINE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
