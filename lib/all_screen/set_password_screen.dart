import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                "Set Password",
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(height: 15,),
              Text(
                "Minimum length password 8 character with \n Latter and number combination",
                style: TextStyle(fontSize: 17,color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter confirm password"),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),
              ElevatedButton.icon(onPressed: (){},label:Text("Confirm")),
              SizedBox(height: 50),
              RichText1(text1: "Have account?",text2: ' Sign in',),
            ],
          ),
        ),
      ),
    );
  }
}
