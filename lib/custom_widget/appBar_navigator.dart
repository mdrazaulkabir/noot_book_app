import 'package:flutter/material.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/profile_update_screen.dart';

import '../all_screen/signin_screen.dart';
class AppbarNavigator extends StatefulWidget {
  const AppbarNavigator({super.key});

  @override
  State<AppbarNavigator> createState() => _AppbarNavigatorState();
}

class _AppbarNavigatorState extends State<AppbarNavigator> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.green,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              _appBarButtonTap();
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    //backgroundImage: Icon(Icons.error),
                  ),
                ),
                Column(
                  children: [
                    Text("Razaul Kabir",style:TextStyle(fontSize: 20,color: Colors.white),),
                    Text("RazaulKabir@gmail.com",style:TextStyle(fontSize: 10,color: Colors.white),)

                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(onPressed: (){
            _logoutButton();
          }, icon: Icon(Icons.logout))
        ],
      ),
    );
  }
  void _appBarButtonTap(){
    final currentRoute=ModalRoute.of(context)!.settings.name;
   if(currentRoute==ProfileUpdateScreen.name){
     return ;
   }
    Navigator.pushNamed(context, ProfileUpdateScreen.name);
  }
  void _logoutButton(){
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);
  }
}
