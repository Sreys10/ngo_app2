import 'package:flutter/material.dart';

void main() {
  runApp(const RainbowDietQuizApp());
}

class RainbowDietQuizApp extends StatelessWidget {
  const RainbowDietQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainbow Diet Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CategorySelectionPage(),
    );
  }
}

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Color Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RainbowDietQuizPage(color: Colors.red),
                  ),
                );
              },
              child: const Text(
                'Red',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RainbowDietQuizPage(color: Colors.orange),
                  ),
                );
              },
              child: const Text(
                'Orange',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RainbowDietQuizPage(color: Colors.yellow),
                  ),
                );
              },
              child: const Text(
                'Yellow',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RainbowDietQuizPage(color: Colors.green),
                  ),
                );
              },
              child: const Text(
                'Green',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RainbowDietQuizPage(color: Colors.blue),
                  ),
                );
              },
              child: const Text(
                'Blue',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RainbowDietQuizPage extends StatefulWidget {
  final Color color;
  const RainbowDietQuizPage({super.key, required this.color});

  @override
  State<RainbowDietQuizPage> createState() => _RainbowDietQuizPageState();
}

class _RainbowDietQuizPageState extends State<RainbowDietQuizPage> {
  int _score = 0;
  int _currentQuestionIndex = 0;
  bool _showFeedback = false;
  String _feedback = '';
  String _correctAnswer = '';
  String _feedbackExplanation = '';

  final Map<Color, List<Map<String, dynamic>>> _quizData = {
    Colors.red: [
      {
        'question': 'Which nutrient is abundant in red fruits and vegetables?',
        'options': ['Vitamin C', 'Beta-Carotene', 'Potassium', 'Iron'],
        'answer': 'Vitamin C',
        'explanation': 'Red fruits like oranges and strawberries are rich in Vitamin C, which helps boost immunity.'
      },
      {
        'question': 'What is the main benefit of red bell peppers?',
        'options': ['Rich in Iron', 'High in Vitamin C', 'Good for digestion', 'Rich in protein'],
        'answer': 'High in Vitamin C',
        'explanation': 'Red bell peppers are high in Vitamin C, which helps in boosting the immune system.'
      },
      {
        'question': 'Which red fruit helps in heart health?',
        'options': ['Apple', 'Pomegranate', 'Strawberry', 'Tomato'],
        'answer': 'Strawberry',
        'explanation': 'Strawberries contain antioxidants that help in reducing the risk of heart diseases.'
      },
      {
        'question': 'Which red vegetable is great for vision?',
        'options': ['Tomato', 'Carrot', 'Spinach', 'Cucumber'],
        'answer': 'Tomato',
        'explanation': 'Tomatoes are rich in lycopene, which helps in maintaining good vision and eye health.'
      },
      {
        'question': 'What is a common red-colored food with high fiber?',
        'options': ['Red Bell Pepper', 'Cherries', 'Beetroot', 'Strawberries'],
        'answer': 'Beetroot',
        'explanation': 'Beetroot is rich in fiber and helps in digestion and heart health.'
      },
    ],
    Colors.orange: [
      {
        'question': 'Orange vegetables are rich in which nutrient?',
        'options': ['Vitamin A', 'Calcium', 'Protein', 'Zinc'],
        'answer': 'Vitamin A',
        'explanation': 'Orange vegetables like carrots are high in Vitamin A, essential for good vision.'
      },
      {
        'question': 'What does Vitamin C in oranges help with?',
        'options': ['Bone health', 'Immune support', 'Skin regeneration', 'Heart health'],
        'answer': 'Immune support',
        'explanation': 'Vitamin C in oranges helps boost the immune system.'
      },
      {
        'question': 'Which orange fruit helps in reducing skin wrinkles?',
        'options': ['Orange', 'Mango', 'Papaya', 'Peach'],
        'answer': 'Orange',
        'explanation': 'Oranges are rich in Vitamin C, which helps improve skin texture and reduces wrinkles.'
      },
      {
        'question': 'Which orange vegetable is high in beta-carotene?',
        'options': ['Pumpkin', 'Carrot', 'Sweet potato', 'Butternut squash'],
        'answer': 'Carrot',
        'explanation': 'Carrots are rich in beta-carotene, which the body converts into Vitamin A for good vision.'
      },
      {
        'question': 'What is the benefit of eating an orange each day?',
        'options': ['Improves digestion', 'Boosts immunity', 'Reduces risk of cancer', 'Enhances memory'],
        'answer': 'Boosts immunity',
        'explanation': 'Oranges are packed with Vitamin C that helps boost the body’s immune system.'
      },
    ],
    Colors.yellow: [
      {
        'question': 'Which vitamin is commonly found in yellow fruits?',
        'options': ['Vitamin B', 'Vitamin C', 'Vitamin D', 'Vitamin E'],
        'answer': 'Vitamin C',
        'explanation': 'Yellow fruits like bananas are rich in Vitamin C, which helps the body absorb iron.'
      },
      {
        'question': 'Which yellow fruit is a great source of potassium?',
        'options': ['Banana', 'Mango', 'Pineapple', 'Papaya'],
        'answer': 'Banana',
        'explanation': 'Bananas are rich in potassium, which helps maintain proper muscle function.'
      },
      {
        'question': 'What does the yellow color in fruits and vegetables indicate?',
        'options': ['High in antioxidants', 'High in calcium', 'Rich in vitamin C', 'Rich in potassium'],
        'answer': 'High in antioxidants',
        'explanation': 'Yellow fruits and vegetables are often high in antioxidants, helping protect cells from damage.'
      },
      {
        'question': 'Which yellow vegetable is rich in Vitamin A?',
        'options': ['Corn', 'Yellow bell pepper', 'Squash', 'Cabbage'],
        'answer': 'Yellow bell pepper',
        'explanation': 'Yellow bell peppers are rich in Vitamin A, essential for eye health and immune function.'
      },
      {
        'question': 'What is the best benefit of consuming yellow peppers?',
        'options': ['Rich in fiber', 'Rich in Vitamin C', 'Good for skin health', 'Rich in protein'],
        'answer': 'Rich in Vitamin C',
        'explanation': 'Yellow peppers are high in Vitamin C, which helps boost immunity and promote healthy skin.'
      },
    ],
    Colors.green: [
      {
        'question': 'Which vegetable is green and rich in iron?',
        'options': ['Spinach', 'Lettuce', 'Broccoli', 'Cucumber'],
        'answer': 'Spinach',
        'explanation': 'Spinach is rich in iron, which is essential for the production of red blood cells.'
      },
      {
        'question': 'Which green fruit is high in Vitamin K?',
        'options': ['Avocado', 'Kiwi', 'Green apple', 'Cucumber'],
        'answer': 'Avocado',
        'explanation': 'Avocados are high in Vitamin K, which supports bone health and blood clotting.'
      },
      {
        'question': 'What does eating green vegetables help with?',
        'options': ['Skin health', 'Bone health', 'Heart health', 'Brain function'],
        'answer': 'Heart health',
        'explanation': 'Green vegetables like spinach and kale are good for heart health due to their high fiber content.'
      },
      {
        'question': 'Which vegetable is great for improving digestion?',
        'options': ['Cucumber', 'Broccoli', 'Kale', 'Spinach'],
        'answer': 'Cucumber',
        'explanation': 'Cucumbers are great for digestion due to their high water content and fiber.'
      },
      {
        'question': 'What nutrient in green vegetables helps maintain eye health?',
        'options': ['Vitamin A', 'Vitamin B', 'Vitamin C', 'Vitamin D'],
        'answer': 'Vitamin A',
        'explanation': 'Green vegetables like kale and spinach are rich in Vitamin A, important for maintaining good vision.'
      },
    ],
    Colors.blue: [
      {
        'question': 'Which blue food is good for heart health?',
        'options': ['Blueberry', 'Eggplant', 'Plum', 'Blue potato'],
        'answer': 'Blueberry',
        'explanation': 'Blueberries are rich in antioxidants and are good for heart health.'
      },
      {
        'question': 'Which nutrient is abundant in blueberries?',
        'options': ['Vitamin C', 'Vitamin A', 'Antioxidants', 'Vitamin E'],
        'answer': 'Antioxidants',
        'explanation': 'Blueberries are packed with antioxidants, which help reduce inflammation and improve overall health.'
      },
      {
        'question': 'What is the main benefit of eating blue foods?',
        'options': ['Good for vision', 'Rich in iron', 'Supports immune health', 'Reduces inflammation'],
        'answer': 'Reduces inflammation',
        'explanation': 'Blue foods like blueberries contain antioxidants that help reduce inflammation in the body.'
      },
      {
        'question': 'Which blue fruit is good for memory improvement?',
        'options': ['Blueberry', 'Grapes', 'Plum', 'Pear'],
        'answer': 'Blueberry',
        'explanation': 'Blueberries are known to improve memory and cognitive function.'
      },
      {
        'question': 'Which blue vegetable is rich in Vitamin C?',
        'options': ['Blue cabbage', 'Purple cauliflower', 'Blue potato', 'Eggplant'],
        'answer': 'Purple cauliflower',
        'explanation': 'Purple cauliflower is rich in Vitamin C, which helps support the immune system.'
      },
    ],
  };

  late List<Map<String, dynamic>> _selectedColorQuestions;

  @override
  void initState() {
    super.initState();
    _selectedColorQuestions = _quizData[widget.color]!;
  }

  void _checkAnswer(String selectedOption) {
    final question = _selectedColorQuestions[_currentQuestionIndex];
    final correctAnswer = question['answer'];
    final explanation = question['explanation'];

    setState(() {
      if (selectedOption == correctAnswer) {
        _score++;
        _feedback = 'Correct!';
      } else {
        _feedback = 'Wrong!';
        _correctAnswer = correctAnswer;
      }
      _feedbackExplanation = explanation;
      _showFeedback = true;
    });

    // Wait before loading next question
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        if (_currentQuestionIndex < _selectedColorQuestions.length - 1) {
          _currentQuestionIndex++;
          _showFeedback = false;
        } else {
          // If all questions for this color are done, show the next category or complete the quiz
          if (widget.color == Colors.blue) {
            // Show final score
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Quiz Completed'),
                  content: Text('Your final score is $_score'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RainbowDietQuizPage(color: _getNextColor(widget.color)),
              ),
            );
          }
        }
      });
    });
  }

  Color _getNextColor(Color currentColor) {
    if (currentColor == Colors.red) return Colors.orange;
    if (currentColor == Colors.orange) return Colors.yellow;
    if (currentColor == Colors.yellow) return Colors.green;
    if (currentColor == Colors.green) return Colors.blue;
    return Colors.red;  // Default fallback
  }

  @override
  Widget build(BuildContext context) {
    final question = _selectedColorQuestions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rainbow Diet Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              question['question'],
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ...question['options']
                .map<Widget>((option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => _checkAnswer(option),
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ))
                .toList(),
            if (_showFeedback)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '$_feedback $_correctAnswer',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            if (_showFeedback && _feedbackExplanation.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  _feedbackExplanation,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}