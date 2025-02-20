import 'package:flutter/material.dart';
import 'activity/quiz_screen.dart';
import 'learning/video_screen.dart';

class RandRFirstPage extends StatelessWidget {
  final String language;

  const RandRFirstPage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language == 'marathi'
              ? 'मुख्य मेनू'
              : language == 'hindi'
                  ? 'मुख्य मेनू'
                  : 'Main Menu',
        ),
        backgroundColor: const Color.fromARGB(150, 221, 59, 59),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Watch Video Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoScreen(language: language),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: const Color.fromARGB(150, 221, 59, 59),
              ),
              child: Text(
                language == 'marathi'
                    ? 'व्हिडिओ पाहा'
                    : language == 'hindi'
                        ? 'वीडियो देखें'
                        : 'Watch Video',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // Start Quiz Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(language: language),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: const Color.fromARGB(150, 221, 59, 59),
              ),
              child: Text(
                language == 'marathi'
                    ? 'क्विझ सुरू करा'
                    : language == 'hindi'
                        ? 'क्विज शुरू करें'
                        : 'Start Quiz',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
