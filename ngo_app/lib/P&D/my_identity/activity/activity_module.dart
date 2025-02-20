import 'package:flutter/material.dart';
import 'vision_board_screen.dart';
import 'growth_mindset_game.dart'; // Import GrowthMindsetGame

class ActivityModule extends StatelessWidget {
  const ActivityModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('क्रियाशीलता विभाग'), // Activity Module in Marathi
        backgroundColor: const Color.fromARGB(255, 247, 174, 78), // Soft pastel pink
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 245, 240, 195), const Color.fromARGB(255, 242, 191, 139)], // Pastel gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActivityButton(
                context,
                title: 'दृष्टीफलक तयार करा', // Create Vision Board in Marathi
                color: Colors.blue.shade200, // Soft pastel blue
                destination: VisionBoardScreen(),
              ),
              SizedBox(height: 20),
              _buildActivityButton(
                context,
                title: 'विकसनशील मानसिकता खेळ', // Growth Mindset Game in Marathi
                color: Colors.green.shade200, // Soft pastel green
                destination: GrowthMindsetGame(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityButton(BuildContext context, {required String title, required Color color, required Widget destination}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5, // Adding a bit of shadow for aesthetics
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87, // Text color to ensure contrast
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
      },
    );
  }
}
