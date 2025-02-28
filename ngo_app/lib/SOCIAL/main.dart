import 'package:flutter/material.dart';
import 'social_home.dart'; // Correct import

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: SocialHomePage(), // ✅ Make sure SocialHomePage exists
    );
  }
}
