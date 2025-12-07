import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/display_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height:size.height*.1,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context,index){
                  return Container(
                    color: Colors.greenAccent,
                    height: size.height*.1,
                    width: size.width*.2,
                    margin: EdgeInsets.all(10),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${index}",style: TextStyle(color: Colors.black),),
                        Text("New",style: TextStyle(color: Colors.black),),
                      ],
                    )),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,       //vvi =>when you not give the itemCount that time we need to Expended also need in api because we don't know the api length
                itemBuilder: (context,index){
                  return DisplayCard();
                }),
          ),
        ],
      ),
    );
  }
}
