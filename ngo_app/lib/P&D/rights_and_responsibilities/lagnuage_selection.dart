import 'package:flutter/material.dart';
import 'r_and_r_first_page.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rights and Responsibilities'),
        backgroundColor: const Color.fromARGB(150, 221, 59, 59),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'तुमची आवडती भाषा निवडा',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Marathi Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RandRFirstPage(language: 'marathi'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: const Color.fromARGB(150, 221, 59, 59),
              ),
              child: const Text('Marathi', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),

            // Hindi Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RandRFirstPage(language: 'hindi'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: const Color.fromARGB(150, 221, 59, 59),
              ),
              child: const Text('Hindi', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),

            // English Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RandRFirstPage(language: 'english'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: const Color.fromARGB(150, 221, 59, 59),
              ),
              child: const Text('English', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
