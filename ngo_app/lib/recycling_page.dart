import 'package:flutter/material.dart';

class RecyclingPage extends StatelessWidget {
  const RecyclingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4.3 Recycling')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Application:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('A recycling guide app with gamification elements.'),
            const SizedBox(height: 10),
            const Text(
              'Activity:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Create DIY videos for upcycling projects. For example, present situations like unused clothes or plastics and ask for suggestions on how to repurpose them.'),
          ],
        ),
      ),
    );
  }
}
