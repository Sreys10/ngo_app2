import 'package:flutter/material.dart';
import 'Activity1_MCQ/mcq_page.dart'; // Ensure this is the path for the MCQ activity
import 'Activity2_ScenarioBased/quiz_page.dart';

class ActivityListPage extends StatelessWidget {
  const ActivityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "अ‍ॅक्टिव्हिटी सूची",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF4A90E2), // Updated to a cool blue shade
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFD0E8F2), const Color(0xFF9EC8F3)], // Light blue gradient
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
                title: 'MCQ अ‍ॅक्टिव्हिटी',
                icon: Icons.list_alt,
                color: const Color(0xFF5DADE2), // Sky blue button
                destination: McqPage(),
              ),
              const SizedBox(height: 20),
              _buildButton(
                context,
                title: 'Quiz अ‍ॅक्टिव्हिटी',
                icon: Icons.quiz,
                color: const Color(0xFF48C9B0), // Teal button
                destination: QuizPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String title, required IconData icon, required Color color, required Widget destination}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon: Icon(icon, size: 24),
      label: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
