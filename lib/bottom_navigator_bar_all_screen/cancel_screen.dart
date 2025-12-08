import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/display_card.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context,index){
              return DisplayCard(textType: TextType.Cancel,);
            })
    );
  }
}
