import 'dart:math';
import 'package:flutter/material.dart';
import 'scenario_dataset.dart'; // Import your dataset

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<Map<String, dynamic>> _quizScenarios; // Holds the randomized subset of scenarios
  int _currentScenarioIndex = 0;
  int _currentQuestionIndex = 0;
  int _score = 0;
  final Map<String, String> _selectedAnswers = {}; // Store selected answers for each character
  bool _isTestCompleted = false; // Flag to indicate if the test is completed

  @override
  void initState() {
    super.initState();
    // Shuffle the dataset and select the first 10 scenarios
    _quizScenarios = List<Map<String, dynamic>>.from(scenarioDataset);
    _quizScenarios.shuffle(Random());
    _quizScenarios = _quizScenarios.take(10).toList();
  }

  void _checkAnswer(String characterName, String selectedEmotion, String correctEmotion) {
    if (selectedEmotion == correctEmotion) {
      setState(() {
        _score++;
      });
    }
  }

  void _nextQuestion() {
    if (_isTestCompleted) return; // Don't allow navigation if the test is completed

    setState(() {
      if (_currentQuestionIndex < _quizScenarios[_currentScenarioIndex]['characters'].length - 1) {
        _currentQuestionIndex++;
      } else {
        _moveToNextScenario();
      }
    });
  }

  void _moveToNextScenario() {
    setState(() {
      if (_currentScenarioIndex < _quizScenarios.length - 1) {
        _currentScenarioIndex++;
        _currentQuestionIndex = 0;
      } else {
        _isTestCompleted = true; // Set test completed flag
        _showResult(); // Show result dialog immediately after finishing all questions
      }
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.orange.shade50,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "परीक्षा पूर्ण झाली!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
              const SizedBox(height: 20),
              Text(
                "तुमचे स्कोर:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.orange.shade700),
              ),
              const SizedBox(height: 20),
              Text(
                "$_score / ${_quizScenarios.length * scenarioDataset[0]['characters'].length}",
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context); // Return to the previous screen
                },
                child: const Text(
                  "ठीक आहे",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.contain,
        height: 300,
        errorBuilder: (context, error, stackTrace) {
          return const Text("प्रतिमा लोड करण्यात अडचण आली आहे.");
        },
      );
    } else {
      return Image.asset(
        imageUrl,
        fit: BoxFit.contain,
        height: 300,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scenario = _quizScenarios[_currentScenarioIndex];
    final character = scenario['characters'][_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("भावना क्विझ"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the scenario number at the top in Marathi
            Text(
              "दृष्य संख्या: ${_currentScenarioIndex + 1}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Center(
              child: _buildImage(scenario['image_url']),
            ),
            const SizedBox(height: 20),
            const Text(
              "प्रश्न: प्रतिमेमधील पात्राच्या भावना ओळखा",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              "पात्राचे नाव: ${character['name']}\nत्याची भावना कोणती आहे?",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...character['emotion_options'].map((emotion) {
              return ElevatedButton(
                onPressed: () {
                  if (_isTestCompleted) return; // Disable interaction after test completion
                  setState(() {
                    // Store the selected emotion for the character
                    _selectedAnswers[character['name']] = emotion;
                    // Check if the selected emotion matches the correct emotion
                    _checkAnswer(character['name'], emotion, character['correct_emotion']);
                  });
                  _nextQuestion(); // Automatically go to the next question
                },
                child: Text(emotion),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
