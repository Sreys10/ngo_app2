import 'package:flutter/material.dart';

class OrganizeChallengePage extends StatelessWidget {
  const OrganizeChallengePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organize a Challenge'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Start Your Challenge',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Encourage yourself and others to adopt sustainable practices. Choose a challenge type and set goals for saving energy, water, or reducing waste.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Challenge Type:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Energy', child: Text('Energy')),
                DropdownMenuItem(value: 'Water', child: Text('Water')),
                DropdownMenuItem(value: 'Waste', child: Text('Waste')),
              ],
              onChanged: (value) {
                // Handle selected value
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select Challenge Type',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Set Your Goal:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'E.g., Reduce water usage by 20%',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save or submit the challenge logic
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Challenge Created'),
                    content: const Text(
                      'Your challenge has been successfully created! Share it with others to inspire them.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Create Challenge',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
