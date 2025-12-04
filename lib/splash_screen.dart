import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  static final String name="SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
      Navigator.pushReplacementNamed(context, SignInScreen.name);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/pic.png',fit:BoxFit.cover,height: double.infinity,width: double.infinity),
    );
  }
}
