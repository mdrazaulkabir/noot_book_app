import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                "Join With Us",
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(height: 30),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your email:"),
              ),
              SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your fist name:"),
              ),
              SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your last name:"),
              ),
              SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your mobile number:"),
              ),
              SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your password:"),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),
              ElevatedButton.icon(onPressed: (){}, label: Text("Sign up"),icon: Icon(Icons.open_in_browser),),
              SizedBox(height: 50),
              RichText1(text1: "Have account?",),
            ],
          ),
        ),
      ),
    );
  }
}
