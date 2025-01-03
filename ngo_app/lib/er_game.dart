import 'package:flutter/material.dart';

class EnvironmentalResourcesGame extends StatefulWidget {
  const EnvironmentalResourcesGame({super.key});

  @override
  _EnvironmentalResourcesGameState createState() =>
      _EnvironmentalResourcesGameState();
}

class _EnvironmentalResourcesGameState
    extends State<EnvironmentalResourcesGame> {
  int forestHealth = 100;
  int pollutionLevel = 0;
  int resources = 100;
  int money = 50;
  String gameStatus = "Game In Progress";
  String decisionMessage = "";

  // Actions that the player can take
  void plantTrees() {
    if (money >= 10) {
      setState(() {
        forestHealth = (forestHealth + 15).clamp(0, 100);
        pollutionLevel = (pollutionLevel - 5).clamp(0, 100);
        resources -= 5;
        money -= 10;
        decisionMessage = "You planted trees! Forest health increased.";
      });
    } else {
      setState(() {
        decisionMessage = "Not enough money to plant trees!";
      });
    }
  }

  void buildFactory() {
    if (money >= 20) {
      setState(() {
        pollutionLevel = (pollutionLevel + 20).clamp(0, 100);
        resources += 10;
        money -= 20;
        decisionMessage = "You built a factory! Pollution level increased.";
      });
    } else {
      setState(() {
        decisionMessage = "Not enough money to build a factory!";
      });
    }
  }

  void recycleWaste() {
    if (money >= 5) {
      setState(() {
        pollutionLevel = (pollutionLevel - 10).clamp(0, 100);
        resources += 5;
        money -= 5;
        decisionMessage = "You recycled waste! Pollution reduced.";
      });
    } else {
      setState(() {
        decisionMessage = "Not enough money to recycle waste!";
      });
    }
  }

  void investInRenewableEnergy() {
    if (money >= 30) {
      setState(() {
        pollutionLevel = (pollutionLevel - 25).clamp(0, 100);
        resources -= 15;
        money -= 30;
        decisionMessage =
            "You invested in renewable energy! Pollution reduced.";
      });
    } else {
      setState(() {
        decisionMessage = "Not enough money to invest in renewable energy!";
      });
    }
  }

  // Game reset
  void resetGame() {
    setState(() {
      forestHealth = 100;
      pollutionLevel = 0;
      resources = 100;
      money = 50;
      gameStatus = "Game In Progress";
      decisionMessage = "";
    });
  }

  // Get the ecosystem status based on resource levels
  String getEcosystemStatus() {
    if (pollutionLevel >= 80) {
      return "Critical";
    } else if (forestHealth <= 20) {
      return "Endangered";
    } else if (pollutionLevel < 30 && forestHealth > 70) {
      return "Thriving";
    }
    return "Stable";
  }

  // Check if the game should end
  void checkGameOver() {
    if (pollutionLevel == 100) {
      setState(() {
        gameStatus = "Game Over! Pollution reached its maximum level.";
      });
    } else if (forestHealth == 0) {
      setState(() {
        gameStatus = "Game Over! Forest health reached zero.";
      });
    } else if (resources <= 0) {
      setState(() {
        gameStatus = "Game Over! You ran out of resources.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkGameOver();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Environmental Resource Management'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Game Status
              Text(
                'Game Status: $gameStatus',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 20),

              // Display Resource Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Forest Health', forestHealth, Colors.green),
                  _buildStatCard('Pollution Level', pollutionLevel, Colors.red),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Resources', resources, Colors.blue),
                  _buildStatCard('Money', money, Colors.yellow),
                ],
              ),
              const SizedBox(height: 20),

              // Decision Message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  decisionMessage,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),

              // Action Buttons - Centered
              Center(
                child: Column(
                  children: [
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
                      onPressed: recycleWaste,
                      child: const Text('Recycle Waste'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: investInRenewableEnergy,
                      child: const Text('Invest in Renewable Energy'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: resetGame,
                      child: const Text('Reset Game'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Add animated GIF at the bottom of the screen
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/ani1.gif', // Path to your GIF
                  height: 200, // Adjust the height as needed
                  width: 200, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create stat cards
  Widget _buildStatCard(String title, int value, Color color) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                value.toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
