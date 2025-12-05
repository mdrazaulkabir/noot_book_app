import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/pin_verification_screen.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';

class EmailAddressScreen extends StatefulWidget {
  const EmailAddressScreen({super.key});
  static final String name='emailAddressScreen';
  @override
  State<EmailAddressScreen> createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {
  final TextEditingController emailTEController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your Email Address",
                  style: TextTheme.of(context).titleLarge,
                ),
                SizedBox(height: 15,),
                Text(
                  "A 6 digit verification pin will\n send to your email address",
                  //style: TextTheme.of(context).titleSmall,  //but you can't take any color because you can take only one =>textTheme
                  style: TextStyle(fontSize: 17,color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your email"),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your valid email';
                    }
                    else if(!value.contains("@")||!value.contains('.')){
                      return "Missing the '@' sign and '.' ";
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
                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerificationScreen()));
                  _onTapEmailAddress();
                }, label:Icon(Icons.arrow_circle_right_outlined,size: 30,),),
                SizedBox(height: 50),
                RichText1(text1: "Have account?",text2: ' Sign in',),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onTapEmailAddress(){
    if(_formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, PinVerificationScreen.name);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTEController.dispose();
  }
}
