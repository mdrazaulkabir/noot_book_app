import 'package:flutter/material.dart';

class RichText1 extends StatelessWidget {
  final String text1;
  final String? text2;//it's not required,, it can be given also not given both accept => text2?? " Sign up"
  const RichText1({super.key, required this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            // text: text2,
            text: text2?? " Sign up",
            style: TextStyle(color: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
