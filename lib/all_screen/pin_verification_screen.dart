import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/set_password_screen.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "PIN Verification",
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(height: 15,),
              Text(
                "A 6 digit verification pin will\n send to your email address",
                style: TextStyle(fontSize: 17,color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your verification number"),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),
              ElevatedButton.icon(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordScreen()));
              },label:Text("Verify")),
              SizedBox(height: 50),
              RichText1(text1: "Have account?",text2: ' Sign in',),
            ],
          ),
        ),
      ),
    );
  }
}
