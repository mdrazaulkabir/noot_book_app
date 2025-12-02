import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Get Started With",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your email"),
              ),
              SizedBox(height: 15),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "Enter your password"),
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),
              ElevatedButton.icon(onPressed: (){}, label: Text("Login"),icon: Icon(Icons.login),),
              SizedBox(height: 50),
              TextButton(onPressed: (){}, child: Text("Forget Password",style: TextStyle(color:Colors.grey),),),
              SizedBox(height: 7),
              RichText(text: TextSpan(
                text: "Don't have account?",style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(text: " Sign up",style: TextStyle(color: Colors.greenAccent))
                ],
              ))

            ],
          ),
        ),
      ),
    );
  }
}
