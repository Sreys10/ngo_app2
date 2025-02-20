import 'package:flutter/material.dart';
import 'emojilearning/emojilearning.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("शिकण्याचे पान"),
        backgroundColor: const Color.fromARGB(255, 126, 87, 194), // Updated color
        centerTitle: true,
        elevation: 4, // Add a slight shadow
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.pink.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Decorative Icon with darker color for visibility
            Icon(
              Icons.school,
              size: 80,
              color: const Color.fromARGB(255, 80, 37, 120), // Darker color
            ),
            const SizedBox(height: 20),

            // Main Title with improved visibility
            const Text(
              "भावनांबद्दल शिका",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 80, 37, 120), // Updated text color
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Description text with improved visibility
            const Text(
              "भावनांचे वेगवेगळे प्रकार समजून घ्या आणि त्याचा अनुभव घ्या. इमोजींच्या माध्यमातून शिकण्याचा प्रवास सुरू करा!",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 50, 25, 90), // Updated text color
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Elevated Button with updated color
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 126, 87, 194), // Updated button color
                foregroundColor: Colors.white,
                shadowColor: Colors.purple.shade200,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              icon: const Icon(Icons.emoji_emotions, size: 28),
              label: const Text(
                "इमोजींबरोबर शिका",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EmojiLearningPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
