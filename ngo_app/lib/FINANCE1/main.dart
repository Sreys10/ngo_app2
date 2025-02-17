import 'compo2/try2.dart';
import 'compo_select.dart';
import 'screens/selection_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/comp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CompPage(),
    );
  }
}
