import 'package:flutter/material.dart';

class EnvironmentalResourcesPage extends StatefulWidget {
  const EnvironmentalResourcesPage({super.key});

  @override
  State<EnvironmentalResourcesPage> createState() => _EnvironmentalResourcesPageState();
}

class _EnvironmentalResourcesPageState extends State<EnvironmentalResourcesPage> {
  int forestHealth = 100;
  int pollutionLevel = 0;
  int resources = 100;

  void plantTrees() {
    setState(() {
      forestHealth += 10;
      pollutionLevel = (pollutionLevel - 5).clamp(0, 100);
    });
  }

  void buildFactory() {
    setState(() {
      pollutionLevel += 15;
      resources += 20;
      forestHealth = (forestHealth - 10).clamp(0, 100);
    });
  }

  void resetGame() {
    setState(() {
      forestHealth = 100;
      pollutionLevel = 0;
      resources = 100;
    });
  }

  String getEcosystemStatus() {
    if (pollutionLevel >= 80) return "Critical";
    if (forestHealth <= 20) return "Endangered";
    if (pollutionLevel < 30 && forestHealth > 70) return "Thriving";
    return "Stable";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Environmental Management Game')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Ecosystem Status: ${getEcosystemStatus()}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Forest Health', forestHealth),
                _buildStatCard('Pollution Level', pollutionLevel),
                _buildStatCard('Resources', resources),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: plantTrees,
              child: const Text('Plant Trees'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: buildFactory,
              child: const Text('Build Factory'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: resetGame,
              child: const Text('Reset Game'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, int value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
