import 'package:flutter/material.dart';
import 'dart:math';

class EnvironmentalResourcesGame extends StatefulWidget {
  const EnvironmentalResourcesGame({super.key});

  @override
  _EnvironmentalResourcesGameState createState() =>
      _EnvironmentalResourcesGameState();
}

class _EnvironmentalResourcesGameState extends State<EnvironmentalResourcesGame>
    with SingleTickerProviderStateMixin {
  // Game Variables
  int waterLevel = 100;
  int treeCount = 50;
  int wildlifePopulation = 50;
  int pollutionLevel = 20;
  int daysSurvived = 0;
  String gameStatus = "खेळ सुरू आहे";
  String eventMessage = "";
  bool _gameOver = false;

  // Corrected Game Balance Parameters
  static const int baseWaterConsumption = 3;
  static const int baseTreeDecline = 2;
  static const int basePollutionIncrease = 3;
  static const int criticalThreshold = 20;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void simulateDay() {
    if (_gameOver) return;

    setState(() {
      daysSurvived++;

      // Base resource changes
      // Water decreases based on trees and pollution
      int waterDecrease = baseWaterConsumption;
      waterDecrease += (treeCount ~/ 20); // More trees consume more water
      if (pollutionLevel > 50) {
        waterDecrease += 1; // High pollution increases water loss
      }
      waterLevel = (waterLevel - waterDecrease).clamp(0, 100);

      // Trees naturally decline and are affected by pollution
      int treeDecrease = baseTreeDecline;
      if (pollutionLevel > 60) treeDecrease += 1;
      if (waterLevel < 30) treeDecrease += 1; // Low water increases tree loss
      treeCount = (treeCount - treeDecrease).clamp(0, 100);

      // Pollution increases based on various factors
      int pollutionIncrease = basePollutionIncrease;
      pollutionIncrease -=
          (treeCount ~/ 25); // Trees help reduce pollution increase
      if (wildlifePopulation > 70) {
        pollutionIncrease += 1; // Large wildlife population increases pollution
      }
      pollutionLevel = (pollutionLevel + pollutionIncrease).clamp(0, 100);

      // Wildlife changes based on environment
      int wildlifeChange = calculateWildlifeChange();
      wildlifePopulation = (wildlifePopulation + wildlifeChange).clamp(0, 100);

      // Random events
      triggerRandomEvent();

      checkGameOver();
    });
  }

  int calculateWildlifeChange() {
    int change = -1; // Base decline

    // Environmental impacts
    if (treeCount < 30) change -= 1; // Not enough trees
    if (waterLevel < 40) change -= 1; // Not enough water
    if (pollutionLevel > 60) change -= 1; // Too much pollution

    // Population control
    if (wildlifePopulation > 70) change -= 1; // Overpopulation
    if (wildlifePopulation < 30) change += 1; // Recovery chance

    return change;
  }

  void triggerRandomEvent() {
    final random = Random().nextDouble();

    if (random < 0.20) {
      // Increased event frequency
      final eventRoll = Random().nextDouble();

      if (eventRoll < 0.25) {
        eventMessage = "दुष्काळ पडला! पाणी पातळी 15% कमी झाली 🌵";
        waterLevel = (waterLevel - 15).clamp(0, 100);
      } else if (eventRoll < 0.50) {
        eventMessage =
            "जंगलात आग लागली! 12% झाडे नष्ट झाली आणि प्रदूषण 8% वाढले 🔥";
        treeCount = (treeCount - 12).clamp(0, 100);
        pollutionLevel = (pollutionLevel + 8).clamp(0, 100);
      } else if (eventRoll < 0.75) {
        eventMessage = "पाऊस पडला! पाणी +10%, प्रदूषण -5% 🌧️";
        waterLevel = (waterLevel + 10).clamp(0, 100);
        pollutionLevel = (pollutionLevel - 5).clamp(0, 100);
      } else {
        eventMessage = "साथीचा रोग! वन्यजीव संख्या 10% कमी झाली 🦠";
        wildlifePopulation = (wildlifePopulation - 10).clamp(0, 100);
      }
    } else {
      eventMessage = "आणखी एक दिवस संपला... 🌞";
    }
  }

  void plantTrees() {
    if (waterLevel >= 20 && !_gameOver) {
      setState(() {
        final treesPlanted = 8;
        treeCount = (treeCount + treesPlanted).clamp(0, 100);
        waterLevel = (waterLevel - 10).clamp(0, 100);
        eventMessage = "$treesPlanted झाडे लावली! 🌳";
      });
    } else {
      setState(() {
        eventMessage = "झाडे लावण्यासाठी पाणी अपुरे! (किमान 20% आवश्यक) 💧";
      });
    }
  }

  void cleanPollution() {
    if (treeCount >= 15 && !_gameOver) {
      setState(() {
        pollutionLevel = (pollutionLevel - 12).clamp(0, 100);
        treeCount = (treeCount - 5).clamp(0, 100);
        eventMessage = "प्रदूषण 12% कमी केले! 5 झाडे वापरली ♻️";
      });
    } else {
      setState(() {
        eventMessage = "प्रदूषण स्वच्छ करण्यासाठी किमान 15 झाडे आवश्यक 🌳";
      });
    }
  }

  void conserveWater() {
    if (!_gameOver) {
      setState(() {
        waterLevel = (waterLevel + 8).clamp(0, 100);
        eventMessage = "जलसंधारण केल्यामुळे पाणी 8% वाढले! 💧";
      });
    }
  }

  void checkGameOver() {
    if (waterLevel <= criticalThreshold ||
        treeCount <= criticalThreshold ||
        wildlifePopulation <= criticalThreshold ||
        pollutionLevel >= 100 - criticalThreshold) {
      _gameOver = true;
      String reason = "";
      if (waterLevel <= criticalThreshold) reason = "पाणी पातळी गंभीर स्थितीत!";
      if (treeCount <= criticalThreshold) {
        reason = "झाडांची संख्या गंभीर स्थितीत!";
      }
      if (wildlifePopulation <= criticalThreshold) {
        reason = "वन्यजीव संख्या गंभीर स्थितीत!";
      }
      if (pollutionLevel >= 100 - criticalThreshold) {
        reason = "प्रदूषण गंभीर स्थितीत!";
      }

      gameStatus = "खेळ संपला! कारण: $reason 🚨";
    }
  }

  void resetGame() {
    setState(() {
      waterLevel = 100;
      treeCount = 50;
      wildlifePopulation = 50;
      pollutionLevel = 20;
      daysSurvived = 0;
      gameStatus = "खेळ सुरू आहे";
      eventMessage = "";
      _gameOver = false;
    });
  }

  // [UI code remains unchanged]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरण संतुलन सिम्युलेटर 🌍'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'खेळाची स्थिती: $gameStatus',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _gameOver ? Colors.red : Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              _buildScoreCard(
                  'जगलेले दिवस 🌞', daysSurvived.toString(), Colors.blue),
              _buildResourceIndicator('पाणी पातळी 💧', waterLevel, Colors.blue),
              _buildResourceIndicator(
                  'झाडांची संख्या 🌳', treeCount, Colors.green),
              _buildResourceIndicator(
                  'वन्यजीव संख्या 🐾', wildlifePopulation, Colors.orange),
              _buildResourceIndicator(
                  'प्रदूषण पातळी 🌫️', pollutionLevel, Colors.red),
              const SizedBox(height: 20),
              _buildEventMessage(),
              const SizedBox(height: 20),
              _buildActionButtons(),
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/ani1.gif',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(String title, String value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: ListTile(
        title: Text(title),
        trailing: Text(value,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }

  Widget _buildResourceIndicator(String title, int value, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: color)),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: value / 100,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10,
            ),
            const SizedBox(height: 8),
            Text('$value%',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildEventMessage() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.amber),
      ),
      child: Text(
        eventMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.brown,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        _buildGameButton('दिवस सिम्युलेट करा 🌞', simulateDay, Colors.amber),
        _buildGameButton('झाडे लावा (10% पाणी) 🌳', plantTrees, Colors.green),
        _buildGameButton(
            'प्रदूषण स्वच्छ करा (5 झाडे) ♻️', cleanPollution, Colors.blue),
        _buildGameButton('पाणी वाचवा 💧', conserveWater, Colors.lightBlue),
        _buildGameButton('रीसेट 🔄', resetGame, Colors.red),
      ],
    );
  }

  Widget _buildGameButton(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton.icon(
      icon: Icon(Icons.circle, size: 16, color: Colors.white),
      label: Text(text),
      onPressed: _gameOver ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
