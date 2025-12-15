import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/display_card.dart';
class CompleteScreen extends StatefulWidget {
  const CompleteScreen({super.key});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context,index){
        // return DisplayCard(textType: TextType.Complete,);
      })
    );
  }
}
