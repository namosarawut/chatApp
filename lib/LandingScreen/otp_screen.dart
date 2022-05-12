import 'package:chatapp/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  String? number;
  String? countrycode;

  OtpScreen({Key? key, required this.number, required this.countrycode})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController _otpFieldController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Verify +${widget.countrycode} ${widget.number}",
          style: TextStyle(color: Colors.indigo),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.indigo))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "We have an SMS with a code to ",
                  style: TextStyle(color: Colors.black, fontSize: 14.5),
                ),
                TextSpan(
                  text: "+${widget.countrycode} ${widget.number}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " Wrong number?",
                  style: TextStyle(
                      color: Colors.indigo[800],
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            OTPTextField(
              controller: _otpFieldController,
              onChanged: (value) {
                print(value);
              },
              length: 5,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => LoginScreen()),
                    (route) => false);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter 6-digit code",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            bottomButton(Icons.message, "Resend SMS"),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: 12,
            ),
            bottomButton(Icons.call, "Call Me")
          ],
        ),
      ),
    );
  }

  Row bottomButton(IconData icon, String balley) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.indigo,
          size: 24,
        ),
        SizedBox(
          width: 25,
        ),
        Text(
          "${balley}",
          style: TextStyle(color: Colors.indigo, fontSize: 14.5),
        )
      ],
    );
  }
}
