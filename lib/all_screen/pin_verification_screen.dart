import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/set_password_screen.dart';
import 'package:note_book_app/custom_widget/rich_text1.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  static final String name="pinVerification";

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  TextEditingController pinTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "PIN Verification",
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(height: 15,),
              Text(
                "A 6 digit verification pin will\n send to your email address",
                style: TextStyle(fontSize: 17,color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                enableActiveFill: false,      //in border color default stay red color
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                controller: pinTEController,
                appContext: (context),                                         //vvi

              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text("Login"),
              // ),
              ElevatedButton.icon(onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordScreen()));
                _setPassword();
              },label:Text("Verify")),
              SizedBox(height: 50),
              RichText1(text1: "Have account?",text2: ' Sign in',),
            ],
          ),
        ),
      ),
    );
  }
  void _setPassword(){
    Navigator.pushReplacementNamed(context, SetPasswordScreen.name);
  }
}
