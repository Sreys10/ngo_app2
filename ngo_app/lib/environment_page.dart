import 'package:flutter/material.dart';

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Environment Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Environmental Resources',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('• Water Conservation'),
            const Text('• Recycling and Waste Disposal'),
            const Text('• Green Energy Initiatives'),
            const SizedBox(height: 30),
            const Text(
              'Resource Management',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('• Reducing Energy Usage'),
            const Text('• Efficient Waste Management'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add additional functionality or navigation if needed
              },
              child: const Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}
