import 'package:flutter/material.dart';
import 'package:note_book_app/splash_screen.dart';

class NoteBookApp extends StatelessWidget {
  const NoteBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
