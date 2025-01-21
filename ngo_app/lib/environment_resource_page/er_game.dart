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
  String gameStatus = "खेळ सुरू आहे";
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

  void simulateDay() {
    setState(() {
      daysSurvived++;
      waterLevel = (waterLevel - 5).clamp(0, 100);
      treeCount = (treeCount - 2).clamp(0, 100);
      wildlifePopulation = (wildlifePopulation - 1).clamp(0, 100);
      pollutionLevel = (pollutionLevel + 3).clamp(0, 100);

      // Random events
      if (daysSurvived % 5 == 0) {
        eventMessage = "दुष्काळ पडला! पाणी पातळी कमी झाली. 🌵";
        waterLevel = (waterLevel - 10).clamp(0, 100);
      } else if (daysSurvived % 7 == 0) {
        eventMessage = "जंगलात आग लागली! झाडे आणि वन्यजीव प्रभावित झाले. 🔥";
        treeCount = (treeCount - 10).clamp(0, 100);
        wildlifePopulation = (wildlifePopulation - 5).clamp(0, 100);
      } else {
        eventMessage = "आणखी एक दिवस संपला... 🌞";
      }

      checkGameOver();
    });
  }

  void plantTrees() {
    if (waterLevel >= 10) {
      setState(() {
        treeCount = (treeCount + 10).clamp(0, 100);
        waterLevel = (waterLevel - 10).clamp(0, 100);
        eventMessage = "तुम्ही झाडे लावली! 🌳";
      });
    } else {
      setState(() {
        eventMessage = "झाडे लावण्यासाठी पुरेसे पाणी नाही! 💧";
      });
    }
  }

  void cleanPollution() {
    if (treeCount >= 5) {
      setState(() {
        pollutionLevel = (pollutionLevel - 20).clamp(0, 100);
        treeCount = (treeCount - 5).clamp(0, 100);
        eventMessage = "तुम्ही प्रदूषण स्वच्छ केले! ♻️";
      });
    } else {
      setState(() {
        eventMessage = "प्रदूषण स्वच्छ करण्यासाठी पुरेशी झाडे नाहीत! 🌳";
      });
    }
  }

  void conserveWater() {
    setState(() {
      waterLevel = (waterLevel + 15).clamp(0, 100);
      eventMessage = "तुम्ही पाणी वाचवले! 💧";
    });
  }

  void checkGameOver() {
    if (waterLevel == 0) {
      setState(() {
        gameStatus = "खेळ संपला! परिसंस्थेतील पाणी संपले. 💀";
      });
    } else if (treeCount == 0) {
      setState(() {
        gameStatus = "खेळ संपला! सर्व झाडे नष्ट झाली. 🪦";
      });
    } else if (wildlifePopulation == 0) {
      setState(() {
        gameStatus = "खेळ संपला! वन्यजीव नामशेष झाले. 🐾";
      });
    } else if (pollutionLevel == 100) {
      setState(() {
        gameStatus = "खेळ संपला! प्रदूषण गंभीर पातळीवर पोहोचले. 🌫️";
      });
    }
  }

  void resetGame() {
    setState(() {
      waterLevel = 100;
      treeCount = 50;
      wildlifePopulation = 30;
      pollutionLevel = 0;
      daysSurvived = 0;
      gameStatus = "खेळ सुरू आहे";
      eventMessage = "";
    });
  }

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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'जगलेले दिवस: $daysSurvived 🌞',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              _buildResourceIndicator('पाणी पातळी 💧', waterLevel, Colors.blue),
              _buildResourceIndicator(
                  'झाडांची संख्या 🌳', treeCount, Colors.green),
              _buildResourceIndicator(
                  'वन्यजीव संख्या 🐾', wildlifePopulation, Colors.orange),
              _buildResourceIndicator(
                  'प्रदूषण पातळी 🌫️', pollutionLevel, Colors.red),
              const SizedBox(height: 20),
              Text(
                eventMessage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildActionButton(
                      'दिवस सिम्युलेट करा 🌞', simulateDay, Colors.amber),
                  _buildActionButton('झाडे लावा 🌳', plantTrees, Colors.green),
                  _buildActionButton(
                      'प्रदूषण स्वच्छ करा ♻️', cleanPollution, Colors.blue),
                  _buildActionButton(
                      'पाणी वाचवा 💧', conserveWater, Colors.lightBlue),
                  _buildActionButton('खेळ रीसेट करा 🔄', resetGame, Colors.red),
                ],
              ),
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
