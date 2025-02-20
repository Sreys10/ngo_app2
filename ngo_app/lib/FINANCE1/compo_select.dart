import 'compo2/try2.dart';
import 'compo3/career_screen.dart';
import 'screens/selection_screen.dart';
import 'package:flutter/material.dart';

class SelectionCompoScreen extends StatelessWidget {
  const SelectionCompoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Component'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildVisitCard(
              context,
              title: '1st Compo',
              color: Colors.orangeAccent,
              destination: SelectionScreen(),
            ),
            const SizedBox(height: 16),
            _buildVisitCard(
              context,
              title: '2nd Compo',
              color: Colors.pinkAccent,
              destination: FamilyBudgetGameApp(),
            ),
            const SizedBox(height: 16),
            _buildVisitCard(
              context,
              title: '3rd Compo',
              color: Colors.lightGreenAccent,
              destination:
                  CareerScreen(), // Replace with your park visit screen
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitCard(
    BuildContext context, {
    required String title,
    required Color color,
    required Widget destination,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ComicSans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
