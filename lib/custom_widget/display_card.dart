import 'package:flutter/material.dart';
import 'package:note_book_app/api_service/all_url.dart';
import 'package:note_book_app/api_service/network_caller.dart';
import 'package:note_book_app/custom_method/show_my_snack_bar.dart';
import 'package:note_book_app/model/new_task_model.dart';
enum TextType{tNew, Complete, Cancel,Progress}
class DisplayCard extends StatefulWidget {
  final TextType textType;
  final NewTaskModel newTaskModel;
  final VoidCallback onStausUpdate;
  const DisplayCard(
      {super.key,
        required this.textType,
        required this.newTaskModel,
        required this.onStausUpdate
      });

  @override
  State<DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<DisplayCard> {
  bool editIconInProgress=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 14,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text("Title:${widget.newTaskModel.title}",style: TextStyle(fontSize:20, color: Colors.black),),
            Text("Description:${widget.newTaskModel.description}",style: TextStyle(fontSize:12, color: Colors.grey),),
            Text("Date:${widget.newTaskModel.createData}",style: TextStyle(fontSize:12, color: Colors.grey,fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chip(label: Text(_chipLabel()),
                  backgroundColor: _chipBackgroundColor(),
                  elevation: 10,
                ),
                Spacer(),
                Visibility(
                  visible: editIconInProgress==false,
                  replacement: CMCircularProgress(),
                  child: IconButton(onPressed: (){
                    _editTaskShowDialog();
                  }, icon: Icon(Icons.edit,color: Colors.greenAccent,)),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever,color: Colors.redAccent,))
              ],
            )
          ],

        ),
      ),
    );
  }

  Color _chipBackgroundColor(){
    if(widget.textType==TextType.tNew){
      return Colors.lightBlueAccent;
    }
    else if(widget.textType==TextType.Complete){
      return Colors.greenAccent;
    }
    else if(widget.textType==TextType.Cancel){
      return Colors.red.shade200;
    }
    else{
      return Colors.brown.shade200;
    }
  }

  String _chipLabel(){
    if(widget.textType==TextType.tNew){
      return "New";
    }
    else if(widget.textType==TextType.Cancel){
      return "Canceled";
    }
    else if(widget.textType==TextType.Complete){
      return "Completed";
    }
    else{
      return 'Progress';
    }
  }

  void _editTaskShowDialog(){
   showDialog(context: context, builder: (ctx){
     return AlertDialog(
       title: Text("Change Status",style: TextStyle(fontSize: 20,color: Colors.black),),
       content: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           ListTile(
             title: Text("New"),
             trailing: _editTaskDialogTrailing(TextType.tNew),
             onTap: (){
               _updateTaskTrailing("New");
             },
           ),
           ListTile(
             title: Text("Completed"),
             trailing: _editTaskDialogTrailing(TextType.Complete),
             onTap: (){
               _updateTaskTrailing("Completed");
             },
           ),
           ListTile(
             title: Text("Canceled"),
             trailing: _editTaskDialogTrailing(TextType.Cancel),
             onTap: (){
               _updateTaskTrailing("Canceled");
             },
           ),
           ListTile(
             title: Text("Progress"),
             trailing: _editTaskDialogTrailing(TextType.Progress),
             onTap: (){
               _updateTaskTrailing("Progressed");
             },
           ),
         ],
       ),
     );
   });
  }
  Widget? _editTaskDialogTrailing(TextType type){
    return widget.textType==type? Icon(Icons.check):null;
  }

  Future<void> _updateTaskTrailing(String status)async{
    Navigator.pop(context);
    editIconInProgress=true;
    setState(() {});
    NetworkResponse response=await NetworkCaller.getData(url: AllUrl.taskUpdateStatus(widget.newTaskModel.id, status));
    editIconInProgress=false;
    setState(() {});

    if(response.isSuccess){
       widget.onStausUpdate;
    }
    else{
      CMSnackBar(context, response.errorMessage!);
    }
  }
}
