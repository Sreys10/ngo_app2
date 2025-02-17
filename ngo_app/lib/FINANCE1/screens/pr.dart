import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart'; // For animations
import 'package:confetti/confetti.dart'; // For confetti

void main() {
  runApp(const FamilyBudgetGameApp());
}

class FamilyBudgetGameApp extends StatelessWidget {
  const FamilyBudgetGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BudgetWise",
      theme: ThemeData(
        primaryColor: const Color(0xFF3498DB),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3498DB),
          secondary: const Color(0xFF5DADE2),
          tertiary: const Color(0xFF76D7C4),
          surface: const Color(0xFFD1F2EB),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3498DB),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF3498DB),
          ),
        ),
      ),
      home: const MainScreen(),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to BudgetWise!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Plan your budget wisely and achieve your financial goals.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScenarioScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Start Challenge"),
              ),
            ],
          ),
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

  bool validateBudget(double totalBudget) {
    double sumOfCategories = suggestedBudget.values.fold(0, (a, b) => a + b);
    return sumOfCategories == totalBudget;
  }

  double getTotalBudget() {
    return suggestedBudget.values.fold(0, (a, b) => a + b);
  }
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
    "Groceries": "assets/FINANCE/pr/groccery.gif",
    "Transportation": "assets/FINANCE/pr/transportation.gif",
    "Entertainment": "assets/FINANCE/pr/entertainment.gif",
    "Savings": "assets/FINANCE/pr/savings.gif",
    "Toys": "assets/FINANCE/pr/t1.gif",
    "Books": "assets/FINANCE/pr/books.gif",
    "Stationery": "assets/FINANCE/pr/stationary.gif",
    "Gift": "assets/FINANCE/pr/gift.gif",
    "Snacks": "assets/FINANCE/pr/snacks.gif",
    "Food": "assets/FINANCE/pr/food.gif",
    "Backpack": "assets/FINANCE/pr/backpack.gif",
    "Sports": "assets/FINANCE/pr/sport.gif",
    "Headphones": "assets/FINANCE/pr/headphone.gif",
    "Mouse": "assets/FINANCE/pr/mouse.gif",
    "Course Fee": "assets/FINANCE/pr/study_materials.gif",
    "Party Contribution": "assets/FINANCE/pr/party.gif",
  };
  Map<int, List<String>> scenarioAchievements = {};

  final List<Scenario> scenarios = [
    Scenario(
      "Summer Job Earnings",
      "You earned ₹2000 from your summer job. Plan your budget for the month.",
      "assets/FINANCE/pr/summerjob.gif",
      {
        "Groceries": 300,
        "Transportation": 200,
        "Entertainment": 400,
        "Savings": 500,
        "Toys": 200
      },
      0,
    ),
    Scenario(
      "Weekend Trip",
      "You want to go on a weekend trip with friends. Allocate your budget accordingly.",
      "assets/FINANCE/pr/trip.gif",
      {
        "Groceries": 200,
        "Transportation": 500,
        "Entertainment": 700,
        "Savings": 100,
        "Toys": 100
      },
      1,
    ),
    Scenario(
      "New Phone Savings",
      "You're saving up for a new phone worth ₹5000. How much can you save this month?",
      "assets/FINANCE/pr/phone.gif",
      {
        "Groceries": 300,
        "Transportation": 100,
        "Entertainment": 200,
        "Savings": 1000,
        "Toys": 100
      },
      2,
    ),
    Scenario(
      "Birthday Gift",
      "You have ₹2000 to buy a gift for your friend's birthday.",
      "assets/FINANCE/pr/gift.gif",
      {"Gift": 700, "Snacks": 100},
      1,
    ),
    Scenario(
      "School Supplies",
      "You need to buy school supplies with ₹2500. Plan your purchases.",
      "assets/FINANCE/pr/school.gif",
      {"Books": 400, "Stationery": 300, "Backpack": 300},
      2,
    ),
    Scenario(
      "Concert Tickets",
      "You want to buy concert tickets worth ₹1800. Plan your savings for this month.",
      "assets/FINANCE/pr/ticket.gif",
      {"Savings": 1000, "Entertainment": 800},
      3,
    ),
  ];

  Stopwatch _stopwatch = Stopwatch(); // Create a stopwatch
  int totalElapsedTime = 0;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
    _validateScenarios();
    _resetCategories();
    _startScenarioTimer(); // Start timer when screen initializes
    _stopwatch.start();
  }

  void _validateScenarios() {
    for (var i = 0; i < scenarios.length; i++) {
      double totalBudget = scenarios[i].getTotalBudget(); // Calculate total
      if (!scenarios[i].validateBudget(totalBudget)) {
        print("Scenario ${scenarios[i].title} has a budget mismatch.");
      }
    }
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
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid allocation. Please adjust your budget."),
          ),
        );
      }
    });
  }

  void _navigateToResult() async {
    if (allocatedBudget > totalBudget) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You have exceeded your budget. Please adjust."),
        ),
      );
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
          currentScenarioIndex: currentScenarioIndex,
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

  void _addAchievement(String achievement, List<String> scenarioAchievements) {
    if (!scenarioAchievements.contains(achievement)) {
      scenarioAchievements.add(achievement);
    }
  }

  void _handleScenarioCompletion(int result) async {
    _controller.play();
    List<String> currentScenarioAchievements =
        scenarioAchievements.putIfAbsent(currentScenarioIndex, () => []);

    if (result > 20 &&
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
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 4, 203, 10),
          content: Text(
            "Well done! You earned some coins.",
            style: TextStyle(color: Color.fromARGB(255, 218, 224, 218)),
          ),
        ),
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
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Achievement Unlocked!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                achievement,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.monetization_on,
                    color: Color(0xFFFFD700),
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "$score",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Continue"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Scenario currentScenario = scenarios[currentScenarioIndex];
    return WillPopScope(
      onWillPop: () async => true, // Allow back navigation
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Scenario"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Time Remaining: ${getFormattedTime()}",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _showScenarioDetails(context, currentScenario),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    currentScenario.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                currentScenario.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
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
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Image.asset(
                                    categoryImages[category]!,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  category,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
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
                        "Remaining Budget: ₹${remainingBudget.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              remainingBudget >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                      LinearProgressIndicator(
                        value: remainingBudget / totalBudget,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation(
                          remainingBudget >= 0 ? Colors.green : Colors.red,
                        ),
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
      barrierDismissible: false,
      builder: (BuildContext context) {
        final screenSize = MediaQuery.of(context).size;
        final dialogWidth = screenSize.width * 0.9;
        final dialogHeight = screenSize.height * 0.8;

        return AlertDialog(
          title: const Text("Scenario Details"),
          content: SizedBox(
            width: dialogWidth,
            height: dialogHeight,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.asset(
                        scenario.imagePath,
                        width: dialogWidth * 0.2,
                        height: dialogWidth * 0.2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    scenario.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Suggested Budget",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: scenario.suggestedBudget.length,
                    itemBuilder: (context, index) {
                      final category =
                          scenario.suggestedBudget.keys.elementAt(index);
                      final amount =
                          scenario.suggestedBudget.values.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text("₹${amount.toStringAsFixed(0)}"),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Continue"),
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
        timer.cancel(); // Prevent memory leaks
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
          content: const Text("You took too long to complete the scenario."),
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
      _startScenarioTimer(); // Start the timer here
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
  final int currentScenarioIndex;

  const ResultScreen({
    super.key,
    required this.scenario,
    required this.budget,
    required this.totalBudget,
    required this.allocatedBudget,
    required this.remainingBudget,
    required this.suggestedBudget,
    required this.currentScenarioIndex,
  });

  @override
  Widget build(BuildContext context) {
    int scenarioScore = 0;
    suggestedBudget.forEach((key, suggested) {
      double difference = (budget[key]! - suggested).abs();
      if (difference <= 50) {
        scenarioScore += 10;
      } else if (difference <= 100) {
        scenarioScore += 5;
      }
    });

    String feedbackMessage = scenarioScore >= 40
        ? "Excellent! You're a budgeting pro!"
        : (scenarioScore >= 20
            ? "Good effort! Keep improving."
            : "Try better next time!");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        backgroundColor: const Color(0xFF3498DB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Scenario ${currentScenarioIndex + 1}: ${scenario.title}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              scenario.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: budget.length,
                itemBuilder: (context, index) {
                  final category = budget.keys.elementAt(index);
                  final amount = budget[category];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.monetization_on,
                        color: Color(0xFFFFD700),
                      ),
                      title: Text(
                        category,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        "₹${amount!.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 2),
            LinearProgressIndicator(
              value: remainingBudget / totalBudget,
              backgroundColor: Colors.grey[300],
              color: remainingBudget >= 0 ? Colors.green : Colors.red,
            ),
            Text(
              "Total Spent: ₹${allocatedBudget.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Remaining Budget: ₹${remainingBudget.toStringAsFixed(2)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: remainingBudget >= 0 ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                feedbackMessage,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedValueDisplay(
              value: scenarioScore,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, scenarioScore);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Next Scenario"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedValueDisplay extends StatelessWidget {
  final int value;
  final TextStyle style;

  const AnimatedValueDisplay({
    super.key,
    required this.value,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: const Duration(seconds: 2),
      builder: (context, animatedValue, child) {
        return Text(
          animatedValue.toString(),
          style: style,
        );
      },
    );
  }
}

class CompletionScreen extends StatelessWidget {
  final int score;
  final int coins;
  final List<String> achievements;

  const CompletionScreen({
    super.key,
    required this.score,
    required this.coins,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Congratulations!"),
        backgroundColor: const Color(0xFF76D7C4),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                child: const Text(
                  "You've completed all scenarios!",
                  style: TextStyle(fontSize: 20, color: Color(0xFF3498DB)),
                ),
              ),
              const SizedBox(height: 20),
              ElasticIn(
                duration: const Duration(milliseconds: 1500),
                child: Text(
                  "Total Score: ₹$score",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3498DB),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Coins: ₹$coins",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  const Icon(
                    Icons.monetization_on,
                    color: Colors.amber,
                    size: 18.0,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DADE2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  );
                },
                child: const Text("Restart Game"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
