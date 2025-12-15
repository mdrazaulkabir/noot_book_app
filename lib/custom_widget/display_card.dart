import 'package:flutter/material.dart';
import 'package:note_book_app/model/new_task_model.dart';
enum TextType{tNew, Complete, Cancel,Progress}
class DisplayCard extends StatelessWidget {
  final TextType textType;
  final NewTaskModel newTaskModel;
  const DisplayCard({super.key, required this.textType, required this.newTaskModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 14,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("Title:${newTaskModel.title}",style: TextStyle(fontSize:20, color: Colors.black),),
            Text("Description:${newTaskModel.description}",style: TextStyle(fontSize:12, color: Colors.grey),),
            Text("Date:${newTaskModel.createData}",style: TextStyle(fontSize:12, color: Colors.grey,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(label: Text(_chipLabel()),
                  backgroundColor: _chipBackgroundColor(),
                  elevation: 10,
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.greenAccent,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever,color: Colors.redAccent,))
              ],
            )
          ],

        ),
      ),
    );
  }
  Color _chipBackgroundColor(){
    if(textType==TextType.tNew){
      return Colors.lightBlueAccent;
    }
    else if(textType==TextType.Complete){
      return Colors.greenAccent;
    }
    else if(textType==TextType.Cancel){
      return Colors.red.shade200;
    }
    else{
      return Colors.brown.shade200;
    }
  }
  String _chipLabel(){
    if(textType==TextType.tNew){
      return "New";
    }
    else if(textType==TextType.Cancel){
      return "Canceled";
    }
    else if(textType==TextType.Complete){
      return "Completed";
    }
    else{
      return 'Progress';
    }
  }
}
