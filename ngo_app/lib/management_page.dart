import 'package:flutter/material.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4.2 Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Application:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('An app for monitoring and managing personal carbon footprints.'),
            const SizedBox(height: 10),
            const Text(
              'Activity:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Organize an online challenge to reduce energy and water usage, such as games encouraging actions like closing water taps or switching off lights.'),
          ],
        ),
      ),
    );
  }
}
