import 'package:flutter/material.dart';
import 'personal_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emotion Learning App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage1(),
    );
  }
}
