import 'package:flutter/material.dart';
import 'learning/learning_module.dart';
import 'activity/activity_module.dart';

class MyIdentityFirstPage extends StatelessWidget {
  const MyIdentityFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'वैयक्तिक विकास',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
            255, 247, 174, 78), // Pastel pink for the app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 245, 240, 195),
              const Color.fromARGB(255, 242, 191, 139)
            ], // Pastel pink to pastel purple gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                context,
                title: 'शिकण्याचा मॉड्यूल',
                icon: Icons.school,
                color: const Color.fromARGB(
                    255, 250, 157, 129), // Pastel pink for Learning button
                destination: LearningModule(),
              ),
              SizedBox(height: 20),
              _buildButton(
                context,
                title: 'क्रियाकलाप मॉड्यूल',
                icon: Icons.work,
                color: const Color.fromARGB(
                    255, 246, 190, 108), // Pastel orange for Activity button
                destination: ActivityModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget destination}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon: Icon(icon, size: 24),
      label: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
