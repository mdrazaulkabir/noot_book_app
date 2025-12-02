import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/login_screen.dart';
import 'package:note_book_app/all_screen/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/pic.png',fit:BoxFit.cover,height: double.infinity,width: double.infinity),
    );
  }
}
