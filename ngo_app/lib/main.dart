import 'package:flutter/material.dart';
import 'ENVIRONMENT/environment_page.dart'; // Import the EnvironmentPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avali',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const EnvironmentPage(), // Directly set EnvironmentPage as the home
    );
  }
}
