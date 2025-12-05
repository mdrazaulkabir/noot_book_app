import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/email_adress_screen.dart';
import 'package:note_book_app/all_screen/signup_screen.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static final String name='signInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailTEController=TextEditingController();
  final TextEditingController passwordTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
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
                  "Get Started With",
                  style: TextTheme.of(context).titleLarge,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: emailTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your email"),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: passwordTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your password"),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your valid password";
                    }
                    else if(value.length <6 || value.length>12){
                      return "Password must be 6 to 12 character!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text("Login"),
                // ),
                ElevatedButton.icon(
                  onPressed: () {
                    _loginButton();
                  },
                  label: Text("Login"),
                  icon: Icon(Icons.login),
                ),
                SizedBox(height: 50),


                TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAddressScreen()));
                    _forgetButton();
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 7),
                RichText1(
                  text1: "Don't have account?",
                  text2: " Sign up",
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()),);
                    _signUPButton();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _loginButton(){
    if(_formKey.currentState!.validate()){
     //navigator another page
    }
  }
  void _forgetButton(){
    Navigator.pushReplacementNamed(context, EmailAddressScreen.name);
  }
  void _signUPButton(){
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
  }

}