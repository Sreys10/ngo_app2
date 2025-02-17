import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // For animations
import 'package:confetti/confetti.dart'; // For confetti

void main() {
  runApp(FamilyBudgetGameApp());
}

class FamilyBudgetGameApp extends StatelessWidget {
  const FamilyBudgetGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BudgetWise',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // More vibrant primary color
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: Colors.lightBlue[50], // Light background
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber, // Example button color
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[300],
          titleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BudgetWise"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to BudgetWise!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "Master the art of budgeting and make smart financial decisions.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScenarioScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: Text("Start the Challenge"),
            ),
          ],
        ),
      ),
    );
  }
}

class Scenario {
  final String title;
  final String description;
  final String imagePath;
  final Map<String, double> suggestedBudget;
  final int level;

  Scenario(this.title, this.description, this.imagePath, this.suggestedBudget,
      this.level);
}

class ScenarioScreen extends StatefulWidget {
  const ScenarioScreen({super.key});

  @override
  _ScenarioScreenState createState() => _ScenarioScreenState();
}

class _ScenarioScreenState extends State<ScenarioScreen> {
  final double totalBudget = 2000;
  double allocatedBudget = 0;
  double remainingBudget = 2000;
  int score = 0;
  int currentScenarioIndex = 0;
  late ConfettiController _controller;
  int currentLevel = 0;
  int coins = 0; // Coins for rewards
  List<String> achievements = [];
  final int inactivityDuration = 30;
  Timer? _inactivityTimer;
  bool isTimerPopupShown = false;
  bool allScenariosCompleted = false;

  Timer? _scenarioTimer; // Timer for each scenario
  int _remainingScenarioTime = 50; // Initial time for each scenario

  Map<String, double> categories = {};
  final Map<String, String> categoryImages = {
    // Declare categoryImages HERE!
    "Groceries": "assets/images/groccery.gif",
    "Transportation": "assets/images/transportation.gif",
    "Entertainment": "assets/images/entertainment.gif",
    "Savings": "assets/images/savings.gif",
    "Personal Care": "assets/images/personal_care.gif",
  };
  Map<int, List<String>> scenarioAchievements = {};
  final List<Scenario> scenarios = [
    // Scenarios with levels
    Scenario(
        "Summer Job Earnings",
        "You earned ₹2000 from your summer job. Plan your budget for the month.",
        "assets/images/summerjob.png",
        {
          "Groceries": 300,
          "Transportation": 200,
          "Entertainment": 400,
          "Savings": 500,
          "Personal Care": 200
        },
        0),
    Scenario(
        "Weekend Trip",
        "You want to go on a weekend trip with friends. Allocate your budget accordingly.",
        "assets//images/trip.png",
        {
          "Groceries": 200,
          "Transportation": 500,
          "Entertainment": 700,
          "Savings": 100,
          "Personal Care": 100
        },
        1),
    Scenario(
        "New Phone Savings",
        "You're saving up for a new phone worth ₹5000. How much can you save this month?",
        "assets/images/phone.png",
        {
          "Groceries": 300,
          "Transportation": 100,
          "Entertainment": 200,
          "Savings": 1000,
          "Personal Care": 100
        },
        2),

    // Add more scenarios with increasing levels
  ];
  final Stopwatch _stopwatch = Stopwatch(); // Create a stopwatch
  int totalElapsedTime = 0;
  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _resetCategories();
    _startScenarioTimer(); // Start timer when screen initializes
    _stopwatch.start();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _controller.dispose();
    _scenarioTimer?.cancel(); // Cancel timer when screen disposes
    super.dispose();
  }

  String getFormattedTime() {
    return _remainingScenarioTime.toString();
  }

  void resetInactivityTimer() {
    if (allScenariosCompleted) return;
    _inactivityTimer?.cancel();
    _inactivityTimer =
        Timer(Duration(seconds: inactivityDuration), showInactivityPopup);
  }

  void updateCategory(String category, double value) {
    setState(() {
      double diff = value - (categories[category] ?? 0);
      if (allocatedBudget + diff <= totalBudget && value >= 0) {
        allocatedBudget += diff;
        remainingBudget = totalBudget - allocatedBudget;
        categories[category] = value;
        // DO NOT CHECK ACHIEVEMENTS HERE ANYMORE
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Invalid allocation! Budget exceeded or negative input."),
          ),
        );
      }
    });
  }

  void _navigateToResult() async {
    if (allocatedBudget > totalBudget) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Budget cannot exceed total budget")));
      return;
    }
    _scenarioTimer?.cancel();

    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ResultScreen(
          scenario: scenarios[currentScenarioIndex],
          budget: Map.from(categories),
          totalBudget: totalBudget,
          allocatedBudget: allocatedBudget,
          remainingBudget: remainingBudget,
          suggestedBudget: scenarios[currentScenarioIndex].suggestedBudget,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );

    if (result != null && result is int) {
      setState(() {
        score += result;
        coins += (result ~/ 10);
      });
      _handleScenarioCompletion(result);
    }
  }

  void _handleScenarioCompletion(int result) async {
    _controller.play();

    List<String> currentScenarioAchievements =
        scenarioAchievements.putIfAbsent(currentScenarioIndex, () => []);

    if (result <= 20 &&
        !currentScenarioAchievements.contains("Keep Improving!")) {
      await _showAchievementPopup(context, "Keep Improving!", result);
      _addAchievement("Keep Improving!", currentScenarioAchievements);
    } else if (result > 20 &&
        result < 30 &&
        !currentScenarioAchievements.contains("Level Up!")) {
      await _showAchievementPopup(context, "Level Up!", result);
      _addAchievement("Level Up!", currentScenarioAchievements);
    } else if (result >= 30 &&
        result < 40 &&
        !currentScenarioAchievements.contains("Money Master!")) {
      await _showAchievementPopup(context, "Money Master!", result);
      _addAchievement("Money Master!", currentScenarioAchievements);
    } else if (result >= 40 &&
        !currentScenarioAchievements.contains("Budgeting Guru!")) {
      await _showAchievementPopup(context, "Budgeting Guru!", result);
      _addAchievement("Budgeting Guru!", currentScenarioAchievements);
    }

    if (currentScenarioIndex == scenarios.length - 1) {
      _completeGame();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Well Done! Coins Earned: ${result ~/ 10}"),
            backgroundColor: Colors.green),
      );
      _goToNextScenario(false);
    }
  }

  void _completeGame() {
    List<String> allAchievements = [];
    scenarioAchievements.forEach((key, value) => allAchievements.addAll(value));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CompletionScreen(
            score: score, coins: coins, achievements: allAchievements),
      ),
    );
  }

  Future<void> _showAchievementPopup(
      BuildContext context, String achievement, int score) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Achievement Unlocked!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(achievement,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Score: $score"),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK")),
          ],
        );
      },
    );
  }

  void _addAchievement(String achievement, List<String> scenarioAchievements) {
    if (!scenarioAchievements.contains(achievement)) {
      scenarioAchievements.add(achievement);
    }
  }

  @override
  Widget build(BuildContext context) {
    Scenario currentScenario = scenarios[currentScenarioIndex];
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
                "Scenario ${currentScenarioIndex + 1} - Level ${currentLevel + 1}")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Timer: ${getFormattedTime()}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _showScenarioDetails(context, currentScenario),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(currentScenario.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 20),
              Text(currentScenario.description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String category = categories.keys.elementAt(index);
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FadeIn(
                              duration: const Duration(milliseconds: 500),
                              child: Row(
                                children: [
                                  Image.asset(categoryImages[category]!,
                                      height: 50, width: 50),
                                  const SizedBox(width: 8),
                                  Text(category,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Slider(
                                value: categories[category]!,
                                min: 0,
                                max: totalBudget,
                                divisions: 20,
                                label:
                                    "₹${categories[category]!.toStringAsFixed(0)}",
                                onChanged: (value) =>
                                    updateCategory(category, value),
                              ),
                            ),
                            Text(
                                "₹${categories[category]!.toStringAsFixed(0)}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Remaining Budget: ₹${remainingBudget.isFinite ? remainingBudget.toStringAsFixed(2) : '0.00'}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: remainingBudget >= 0
                                ? Colors.green
                                : Colors.red),
                      ),
                      LinearProgressIndicator(
                        value: remainingBudget / totalBudget,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            remainingBudget >= 0 ? Colors.green : Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:
                    allocatedBudget <= totalBudget ? _navigateToResult : null,
                child: const Text("Submit Budget"),
              ),
              ConfettiWidget(
                confettiController: _controller,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showScenarioDetails(BuildContext context, Scenario scenario) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        final dialogWidth =
            screenSize.width * 0.9; // Dialog width as 90% of screen width
        final dialogHeight =
            screenSize.height * 0.8; // Dialog height as 80% of screen height

        return AlertDialog(
          title: Text(scenario.title),
          content: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: Column(
              children: [
                Expanded(
                  flex: 3, // Image takes approximately 60% of the dialog height
                  child: Image.asset(
                    scenario.imagePath,
                    width: dialogWidth, // Image width adjusts to dialog
                    fit: BoxFit
                        .contain, // Maintains aspect ratio without cropping
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 2, // Description takes the remaining space
                  child: SingleChildScrollView(
                    child: Text(
                      scenario.description,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _startScenarioTimer() {
    _remainingScenarioTime = 50;
    _scenarioTimer?.cancel(); // Cancel any existing timer
    _scenarioTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_remainingScenarioTime > 0) {
            _remainingScenarioTime--;
          } else {
            timer.cancel();
            showInactivityPopup();
          }
        });
      } else {
        timer.cancel(); // Very Important to prevent memory leaks
      }
    });
  }

  void showInactivityPopup() {
    if (!isTimerPopupShown && mounted) {
      isTimerPopupShown = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Time's Up!"),
          content:
              const Text("You have exceeded the time limit for this scenario."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _goToNextScenario(true); // Indicate it's from timeout
                isTimerPopupShown = false;
              },
              child: const Text("Continue"),
            ),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                isTimerPopupShown = false;
              },
              child: const Text("Exit"),
            ),
          ],
        ),
      ).then((_) {
        if (mounted) {
          setState(() {
            isTimerPopupShown = false;
          });
        }
      });
    }
  }

  void _resetCategories() {
    setState(() {
      categories = Map.from(scenarios[currentScenarioIndex].suggestedBudget);
      allocatedBudget = 0;
      remainingBudget = totalBudget;
      _startScenarioTimer(); //Start the timer here
    });
  }

  void _goToNextScenario(bool fromTimeout) {
    setState(() {
      if (currentScenarioIndex < scenarios.length - 1) {
        currentScenarioIndex++;
        if (scenarios[currentScenarioIndex].level > currentLevel) {
          currentLevel = scenarios[currentScenarioIndex].level;
        }
        _resetCategories(); // Reset categories and importantly START THE TIMER
      } else {
        _completeGame();
      }
    });
  }
}

class ResultScreen extends StatelessWidget {
  final Scenario scenario;
  final Map<String, double> budget;
  final double totalBudget;
  final double allocatedBudget;
  final double remainingBudget;
  final Map<String, double> suggestedBudget;

  const ResultScreen({
    super.key,
    required this.scenario,
    required this.budget,
    required this.totalBudget,
    required this.allocatedBudget,
    required this.remainingBudget,
    required this.suggestedBudget,
  });

  @override
  Widget build(BuildContext context) {
    int scenarioScore = 0;

    suggestedBudget.forEach((key, suggested) {
      double difference = (budget[key]! - suggested).abs();
      if (difference <= 50) {
        scenarioScore += 10;
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Results")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Scenario: ${scenario.title}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(scenario.description,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: budget.entries.map((entry) {
                  return Card(
                    child: ListTile(
                      title: Text(entry.key),
                      trailing: Text("₹${entry.value.toStringAsFixed(2)}"),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            Text("Total Spent: ₹${allocatedBudget.toStringAsFixed(2)}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Remaining Budget: ₹${remainingBudget.toStringAsFixed(2)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: remainingBudget >= 0 ? Colors.green : Colors.red)),
            const SizedBox(height: 20),
            FadeIn(
              duration: const Duration(milliseconds: 500),
              child: Text("Score for this scenario: $scenarioScore",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Center(
              child: ZoomIn(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, scenarioScore);
                  },
                  child: const Text("Next Scenario"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompletionScreen extends StatelessWidget {
  final int score;
  final int coins;
  final List<String> achievements;

  const CompletionScreen(
      {super.key,
      required this.score,
      required this.coins,
      required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Congratulations")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              duration: const Duration(milliseconds: 1000),
              child: const Text("You have completed all scenarios!",
                  style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),
            ElasticIn(
              duration: const Duration(milliseconds: 1500),
              child: Text("Total Score: $score",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total Coins: $coins",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()));
              },
              child: const Text("Restart the Game"),
            ),
          ],
        ),
      ),
    );
  }
}
