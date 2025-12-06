import 'package:flutter/material.dart';
import 'package:note_book_app/all_screen/signin_screen.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/new_page_screen.dart';
class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});
  static final String name='navigatorScreen';

  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorScreenState();
}

class _MainNavigatorScreenState extends State<MainNavigatorScreen> {
  final List<Widget>navigatorScreen=[];
  final int _selectedScreen=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Spacer(),
            IconButton(onPressed: (){
              _logoutButton();
            }, icon: Icon(Icons.logout))
          ],
        ),
      ),
      body: NewPageScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          value = _selectedScreen;
          setState(() {});
        },
        currentIndex: _selectedScreen,
        // backgroundColor: Colors.grey,
        // selectedItemColor: Colors.green,
        // unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
             backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "New Task",
          ),
          BottomNavigationBarItem(
             backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "New Task",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "New Task",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "New Task",
          ),
        ],
      ),
    );
  }
  void _logoutButton(){
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate)=>false);
  }
}
