import 'package:flutter/material.dart';
import 'environmental_resources_page.dart';
import 'management_page.dart';
import 'recycling_page.dart';
import 'waste_disposal_page.dart';

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Environment Page')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EnvironmentalResourcesPage()),
                );
              },
              child: const Text('4.1 Environmental Resources'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ManagementPage()),
                );
              },
              child: const Text('4.2 Management'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecyclingPage()),
                );
              },
              child: const Text('4.3 Recycling'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WasteDisposalPage()),
                );
              },
              child: const Text('4.4 Waste Disposal'),
            ),
          ],
        ),
      ),
    );
  }
}
