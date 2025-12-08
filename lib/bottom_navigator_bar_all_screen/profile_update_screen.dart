import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_book_app/custom_widget/appBar_navigator.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});
  static final String name='profileUpdate';

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final TextEditingController emailTEController=TextEditingController();
  final TextEditingController fistNTEController=TextEditingController();
  final TextEditingController lastNTEController=TextEditingController();
  final TextEditingController mobileTEController=TextEditingController();
  final TextEditingController passwordTEController=TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final ImagePicker imagePicker=ImagePicker();
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child:AppbarNavigator()),
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
                  "Update Profile",
                  style: TextTheme.of(context).titleLarge,
                ),
                SizedBox(height: size.height*.05,),
                Container(
                height: size.height*.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: size.height*.06,
                        width: size.width*.2,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Center(child:IconButton(onPressed: (){
                          onTapPickedImage();
                        }, icon: Text("Photo"))),
                      ),
                      SizedBox(width: size.width*.02,),
                      Expanded(    //here expanded used because this parent => container width is fixed
                        child: Text(_selectedImage == null?'Photo is not selected' :
                        _selectedImage!.name, textAlign: TextAlign.center,
                          maxLines: 1,overflow: TextOverflow.ellipsis,),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: size.height*.02,),
                TextFormField(
                  controller: emailTEController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter valid email';
                    }
                    else if(!value.contains('@')||!value.contains('.')){
                      return "Missing sign '@' and '.' ";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your email:"),
                ),
                SizedBox(height: size.height*.02,),
                TextFormField(
                  controller: fistNTEController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter valid first name';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your fist name:"),
                ),
                SizedBox(height: size.height*.02,),
                TextFormField(
                  controller: lastNTEController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter valid last name';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your last name:"),
                ),
                SizedBox(height: size.height*.02,),
                TextFormField(
                  controller: mobileTEController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter valid mobile number';
                    }
                    else if(value.length!=11){
                      return 'Mobile number must be 11 digit';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your mobile number:"),
                ),
                SizedBox(height: size.height*.02,),
                TextFormField(
                  controller: passwordTEController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter valid password!';
                    }
                    else if(value.length<6||value.length>12){
                      return 'Password must be 6 to 12 character';
                    }
                    else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) { //this collect by online
                      return "Password must contain both letters and numbers";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your password:"),
                ),
                SizedBox(height: size.height*.03,),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text("Login"),
                // ),
                ElevatedButton.icon(onPressed: (){
                  _updateButton();
                }, label: Text("Update"),icon: Icon(Icons.open_in_browser),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _updateButton(){
    if(_formKey.currentState!.validate()){
      //navigator
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully update profile")));
  }
  Future onTapPickedImage()async{
    final XFile? imagePicked= await imagePicker.pickImage(source: ImageSource.camera);
    if(imagePicked!=null){
      _selectedImage=imagePicked;
      setState(() {

      });
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailTEController.dispose();
    fistNTEController.dispose();
    lastNTEController.dispose();
    mobileTEController.dispose();
    passwordTEController.dispose();
  }
}
