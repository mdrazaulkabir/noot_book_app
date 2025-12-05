import 'package:flutter/material.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});
  static final String name='setPasswordScreen';
  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController passTEController=TextEditingController();
  final TextEditingController confirmTEController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Set Password",
                  style: TextTheme.of(context).titleLarge,
                ),
                SizedBox(height: 15,),
                Text(
                  "Minimum length password 8 character with \n Latter and number combination",
                  style: TextStyle(fontSize: 17,color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: passTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter password"),
                  validator: (value){
                    if(value==null||value.trim().isEmpty){
                      return "Enter valid password!";
                    }
                    else if(value.length<6||value.length>12){
                      return "Password must be 6 to 12 character";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: confirmTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter confirm password"),
                  validator: (value){
                    if(value!.trim()!=passTEController.text){
                      return "Your password doesn't match!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text("Login"),
                // ),
                ElevatedButton.icon(onPressed: (){
                  _verifyButton();
                },label:Text("Confirm")),
                SizedBox(height: 50),
                RichText1(text1: "Have account?",text2: ' Sign in',),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _verifyButton(){
    if(_formKey.currentState!.validate()){
      //navigator
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passTEController.dispose();
    confirmTEController.dispose();
  }
}
