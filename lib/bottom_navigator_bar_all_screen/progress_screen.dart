import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/display_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
              return DisplayCard(textType: TextType.Progress,);
            })
    );
  }
}
