import 'package:flutter/material.dart';

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
  int wildlifePopulation = 30;
  int pollutionLevel = 0;
  int daysSurvived = 0;
  String gameStatus = "Game In Progress";
  String eventMessage = "";

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

  // Simulate a day passing
  void simulateDay() {
    setState(() {
      daysSurvived++;
      waterLevel = (waterLevel - 5).clamp(0, 100);
      treeCount = (treeCount - 2).clamp(0, 100);
      wildlifePopulation = (wildlifePopulation - 1).clamp(0, 100);
      pollutionLevel = (pollutionLevel + 3).clamp(0, 100);

      // Random events
      if (daysSurvived % 5 == 0) {
        eventMessage = "A drought occurred! Water levels decreased. 🌵";
        waterLevel = (waterLevel - 10).clamp(0, 100);
      } else if (daysSurvived % 7 == 0) {
        eventMessage = "A wildfire broke out! Trees and wildlife affected. 🔥";
        treeCount = (treeCount - 10).clamp(0, 100);
        wildlifePopulation = (wildlifePopulation - 5).clamp(0, 100);
      } else {
        eventMessage = "Another day passes... 🌞";
      }

      checkGameOver();
    });
  }

  // Player Actions
  void plantTrees() {
    if (waterLevel >= 10) {
      setState(() {
        treeCount = (treeCount + 10).clamp(0, 100);
        waterLevel = (waterLevel - 10).clamp(0, 100);
        eventMessage = "You planted trees! 🌳";
      });
    } else {
      setState(() {
        eventMessage = "Not enough water to plant trees! 💧";
      });
    }
  }

  void cleanPollution() {
    if (treeCount >= 5) {
      setState(() {
        pollutionLevel = (pollutionLevel - 20).clamp(0, 100);
        treeCount = (treeCount - 5).clamp(0, 100);
        eventMessage = "You cleaned pollution! ♻️";
      });
    } else {
      setState(() {
        eventMessage = "Not enough trees to clean pollution! 🌳";
      });
    }
  }

  void conserveWater() {
    setState(() {
      waterLevel = (waterLevel + 15).clamp(0, 100);
      eventMessage = "You conserved water! 💧";
    });
  }

  // Check if the game should end
  void checkGameOver() {
    if (waterLevel == 0) {
      setState(() {
        gameStatus = "Game Over! The ecosystem ran out of water. 💀";
      });
    } else if (treeCount == 0) {
      setState(() {
        gameStatus = "Game Over! All trees were destroyed. 🪦";
      });
    } else if (wildlifePopulation == 0) {
      setState(() {
        gameStatus = "Game Over! Wildlife went extinct. 🐾";
      });
    } else if (pollutionLevel == 100) {
      setState(() {
        gameStatus = "Game Over! Pollution reached critical levels. 🌫️";
      });
    }
  }

  // Reset the game
  void resetGame() {
    setState(() {
      waterLevel = 100;
      treeCount = 50;
      wildlifePopulation = 30;
      pollutionLevel = 0;
      daysSurvived = 0;
      gameStatus = "Game In Progress";
      eventMessage = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eco Balance Simulator 🌍'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Game Status
              Text(
                'Game Status: $gameStatus',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),

              // Days Survived
              Text(
                'Days Survived: $daysSurvived 🌞',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),

              // Resource Indicators
              _buildResourceIndicator(
                  'Water Level 💧', waterLevel, Colors.blue),
              _buildResourceIndicator('Tree Count 🌳', treeCount, Colors.green),
              _buildResourceIndicator(
                  'Wildlife Population 🐾', wildlifePopulation, Colors.orange),
              _buildResourceIndicator(
                  'Pollution Level 🌫️', pollutionLevel, Colors.red),
              const SizedBox(height: 20),

              // Event Message
              Text(
                eventMessage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildActionButton(
                      'Simulate Day 🌞', simulateDay, Colors.amber),
                  _buildActionButton(
                      'Plant Trees 🌳', plantTrees, Colors.green),
                  _buildActionButton(
                      'Clean Pollution ♻️', cleanPollution, Colors.blue),
                  _buildActionButton(
                      'Conserve Water 💧', conserveWater, Colors.lightBlue),
                  _buildActionButton('Reset Game 🔄', resetGame, Colors.red),
                ],
              ),
              const SizedBox(height: 20),

              // Animated Earth GIF
              Center(
                child: Image.asset(
                  'assets/ani1.gif', // Replace with your animated Earth GIF
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

  // Helper function to create resource indicators
  Widget _buildResourceIndicator(String title, int value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: value / 100,
              backgroundColor: color.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            const SizedBox(height: 10),
            Text(
              "$value%",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create action buttons
  Widget _buildActionButton(String text, VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
