import 'home_screen.dart';
import 'home_screen1.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FINANCE'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/FINANCE/images/main_bg.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildVisitCard(
                context,
                title: 'Fair Visit',
                color: Colors.orangeAccent,
                imageAsset: 'assets/FINANCE/images/select_fair.png',
                destination: HomeScreen(),
              ),
              const SizedBox(height: 16),
              _buildVisitCard(
                context,
                title: 'Mall Visit',
                color: Colors.pinkAccent,
                imageAsset: 'assets/FINANCE/images/select_mall1.png',
                destination: HomeScreen1(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisitCard(
    BuildContext context, {
    required String title,
    required Color color,
    required String imageAsset,
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
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imageAsset,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
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
