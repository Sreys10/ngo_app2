import 'package:flutter/material.dart';
import 'learning/learning.dart';
import 'activity/activitylist.dart';

class EmotionFirstPage extends StatelessWidget {
  const EmotionFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'भावना शिक्षण',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF6200EA),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFB39DDB)],
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
                title: 'शिकणे',
                icon: Icons.school,
                color: Color(0xFF6200EA),
                destination: LearningPage(),
              ),
              SizedBox(height: 20),
              _buildButton(
                context,
                title: 'कार्य',
                icon: Icons.play_arrow,
                color: Color(0xFF6200EA),
                destination: ActivityListPage(),
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      icon: Icon(icon, size: 24, color: Colors.white),
      label: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
