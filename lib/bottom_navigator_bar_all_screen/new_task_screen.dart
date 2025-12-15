import 'package:flutter/material.dart';
import 'package:note_book_app/api_service/all_url.dart';
import 'package:note_book_app/api_service/network_caller.dart';
import 'package:note_book_app/custom_method/show_my_snack_bar.dart';
import 'package:note_book_app/custom_widget/display_card.dart';
import 'package:note_book_app/model/new_task_model.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getNewTaskInProgress=false;
  List<NewTaskModel>newTaskData=[];
  @override
  void initState() {
    super.initState();
    _newTaskList();
  }
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
          Visibility(
            visible: _getNewTaskInProgress==false,
            replacement: CMCircularProgress(),
            child: Expanded(
              child: ListView.builder(
                  itemCount:newTaskData.length,       //vvi =>when you not give the itemCount that time we need to Expended also need in api because we don't know the api length
                  itemBuilder: (context,index){
                    return DisplayCard(textType: TextType.tNew,newTaskModel: newTaskData[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Future<void>_newTaskList()async{
    _getNewTaskInProgress=true;
    setState(() {});
    NetworkResponse response=await NetworkCaller.getData(url:AllUrl.newTaskList);
    if(response.isSuccess){
      final List<NewTaskModel>data=[];
      for(Map<String,dynamic>listData in response.body!['data']){
        data.add(NewTaskModel.formJson(listData));
      }
      newTaskData=data;
    }
    else{
      CMSnackBar(context, response.errorMessage.toString());
    }
    _getNewTaskInProgress=false;
    setState(() {});
  }
}
