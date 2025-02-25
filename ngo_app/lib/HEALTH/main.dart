import 'package:flutter/material.dart';
import 'screens/front_page.dart'; // Import the front page screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Selector',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const FrontPage(), // Start with the front page
    );
  }
}
