import 'package:flutter/material.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/add_new_task.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/cancel_screen.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/complete_screen.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/new_task_screen.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/profile_update_screen.dart';
import 'package:note_book_app/bottom_navigator_bar_all_screen/progress_screen.dart';
import 'package:note_book_app/custom_widget/appBar_navigator.dart';
class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});
  static final String name='navigatorScreen';

  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorScreenState();
}

class _MainNavigatorScreenState extends State<MainNavigatorScreen> {
  final List<Widget>navigatorScreen=[NewTaskScreen(),CompleteScreen(),CancelScreen(),ProgressScreen()];
  late int _selectedScreen=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppbarNavigator(), //vvi you can take like this way because scaffold can't take this type of parameter
      //vvi
      appBar: PreferredSize(preferredSize: Size.fromHeight(kToolbarHeight), child: AppbarNavigator()),
      body: navigatorScreen[_selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          _selectedScreen=value;
          setState(() {});
        },
        currentIndex: _selectedScreen,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
             // backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "New Task",
          ),
          BottomNavigationBarItem(
             // backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "Complete",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "Cancel",
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.greenAccent,
            icon: Icon(Icons.receipt_outlined, color: Colors.lightGreen),
            label: "Progress",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          _floatingActionButton();
        },
        child: Icon(Icons.edit,color: Colors.greenAccent,),
      ),
    );
  }
  void _floatingActionButton(){
    Navigator.pushNamed(context,ProfileUpdateScreen.name);
  }
}
