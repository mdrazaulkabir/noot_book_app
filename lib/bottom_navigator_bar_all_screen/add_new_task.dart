import 'package:flutter/material.dart';
import 'package:note_book_app/api_service/all_url.dart';
import 'package:note_book_app/api_service/network_caller.dart';
import 'package:note_book_app/custom_method/show_my_snack_bar.dart';
import 'package:note_book_app/custom_widget/appBar_navigator.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});
  static final String name='addNewTask';

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController subjectTEController=TextEditingController();
  final TextEditingController descriptionTEController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  bool elevatedButtonProgress=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppbarNavigator()),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Add New Task",style:TextTheme.of(context).titleLarge),
                SizedBox(
                  height:size.height*.05,
                ),
                TextFormField(
                  controller: subjectTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Subject"
                  ),
                ),
                SizedBox(
                  height:size.height*.02,
                ),
                TextFormField(
                  controller: descriptionTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: "Description",
                  ),
                  maxLines: 5,
                ),
                SizedBox(
                  height:size.height*.05,
                ),
                Visibility(
                  visible: elevatedButtonProgress==false,
                  replacement: CMCircularProgress(),
                  child: ElevatedButton(onPressed: (){
                    _elevatedButton();
                  }, child: Icon(Icons.arrow_circle_right_outlined)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
   void _elevatedButton(){
    if(_formKey.currentState!.validate()){
      _onPressElevatedButton();
    }
  }
  Future<void>_onPressElevatedButton()async{
    elevatedButtonProgress=true;
    setState(() { });
    Map<String,dynamic>requestBody={
        "title":subjectTEController.text.trim(),
        "description": descriptionTEController.text.trim(),
        "status":"New"
    };
    NetworkResponse response=await NetworkCaller.postData(AllUrl.createTask,requestBody);
    elevatedButtonProgress=false;
    setState(() { });

    if(response.isSuccess){
     CMSnackBar(context, 'Successfully added the task!');
     subjectTEController.clear();
     descriptionTEController.clear();
    }
    else{
      CMSnackBar(context, response.errorMessage.toString());
    }
  }
  @override
  void dispose() {
    super.dispose();
    subjectTEController.dispose();
    descriptionTEController.dispose();
  }
}
