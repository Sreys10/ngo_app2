import 'package:flutter/material.dart';

void main() {
  runApp(MySocietyActivityPage());
}

class MySocietyActivityPage extends StatelessWidget {
  const MySocietyActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'प्रश्नोत्तरी ऍप',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;
  Map<int, String> userAnswers = {};
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  List<Map<String, dynamic>> questions = [
    {
      'role': 'अग्निशामक',
      'image': 'assets/SOCIAL/firefighter.jpg',
      'question': 'अग्निशामक कोणते काम करतो?',
      'type': 'multiple_choice',
      'options': [
        'आग विझवणे',
        'रंगकाम करणे',
        'इमारत बांधणे',
        'रोगांची चिकित्सा करणे'
      ],
      'answer': 'आग विझवणे',
    },
    {
      'role': 'दंतवैद्य',
      'image': 'assets/SOCIAL/dentist.jpg',
      'question': 'दंतवैद्य कोणते साधन वापरतो?',
      'type': 'multiple_choice',
      'options': ['ड्रिल', 'रंगकामाचा ब्रश', 'दुर्बीण', 'हातोडा'],
      'answer': 'ड्रिल',
    },
    {
      'role': 'अभियंता',
      'image': 'assets/SOCIAL/engineer.jpg',
      'question': 'खरे की खोटे: अभियंते संरचना डिझाइन करत नाहीत.',
      'type': 'true_false',
      'answer': 'खोटे',
    },
    {
      'role': 'डॉक्टर',
      'image': 'assets/SOCIAL/doctor.jpg',
      'question':
          'डॉक्टर रुग्णाच्या हृदयाचा ठोका तपासण्यासाठी कोणते साधन वापरतो?',
      'type': 'multiple_choice',
      'options': ['स्टेथोस्कोप', 'रंगकामाचा ब्रश', 'कॅल्क्युलेटर', 'हातोडा'],
      'answer': 'स्टेथोस्कोप',
    },
    {
      'role': 'शेतकरी',
      'image': 'assets/SOCIAL/farmer.jpg',
      'question': 'खरे की खोटे: शेतकरी नांगरणीसाठी नांगर वापरतो.',
      'type': 'true_false',
      'answer': 'खरे',
    },
    {
      'role': 'शिक्षक',
      'image': 'assets/SOCIAL/teacher.jpg',
      'question': 'शिक्षक विद्यार्थ्यांना शिकवण्यासाठी कोणते साधन वापरतो?',
      'type': 'multiple_choice',
      'options': ['ब्लॅकबोर्ड', 'कंप्यूटर', 'स्टेथोस्कोप', 'हातोडा'],
      'answer': 'ब्लॅकबोर्ड',
    },
    {
      'role': 'शास्त्रज्ञ',
      'image': 'assets/SOCIAL/scientist.jpg',
      'question': 'खरे की खोटे: शास्त्रज्ञ प्रयोग करतात.',
      'type': 'true_false',
      'answer': 'खरे',
    },
    {
      'role': 'पोलीस अधिकारी',
      'question': 'पोलीस अधिकाऱ्याच्या साधनांची योग्य प्रतिमा निवडा.',
      'type': 'image_selection',
      'options': [
        'assets/SOCIAL/dentist.jpg',
        'assets/SOCIAL/doctor.jpg',
        'assets/SOCIAL/police_officer.jpg'
      ],
      'answer': 'assets/SOCIAL/police_officer.jpg',
    },
    {
      'role': 'लेखापाल',
      'image': 'assets/SOCIAL/accountant.jpg',
      'question': 'लेखापालाची प्राथमिक जबाबदारी काय आहे?',
      'type': 'multiple_choice',
      'options': [
        'वित्त व्यवस्थापन',
        'शस्त्रक्रिया करणे',
        'विद्यार्थ्यांना शिकवणे',
        'यंत्रे दुरुस्त करणे'
      ],
      'answer': 'वित्त व्यवस्थापन',
    },
    {
      'role': 'कलाकार',
      'question': 'कलाकाराच्या साधनांची योग्य प्रतिमा निवडा.',
      'type': 'image_selection',
      'options': [
        'assets/SOCIAL/engineer.jpg',
        'assets/SOCIAL/artist.jpg',
        'assets/SOCIAL/teacher.jpg'
      ],
      'answer': 'assets/SOCIAL/artist.jpg',
    },
  ];
  String? selectedAnswer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  void navigateQuestion(int direction) {
    if (userAnswers[currentQuestionIndex] == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('कृपया पुढे जाण्यापूर्वी प्रश्नाचे उत्तर द्या.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      _controller.reverse().then((_) {
        setState(() {
          currentQuestionIndex += direction;
          selectedAnswer =
              null; // Reset the selected answer for the next question
          _controller.forward();
        });
      });
    });
  }

  void submitAnswer(String answer) {
    setState(() {
      userAnswers[currentQuestionIndex] = answer;
      selectedAnswer = answer; // Store the selected answer
    });
  }

  Color getButtonColor(String option) {
    if (selectedAnswer == null) {
      return Colors.teal[500]!; // Default color when no answer is selected
    } else if (selectedAnswer == option) {
      return Colors.green; // Color when selected answer matches the option
    } else {
      return Colors.grey; // Color for unselected options
    }
  }

  Color getImageBorderColor(String imageOption) {
    return selectedAnswer == imageOption ? Colors.green : Colors.transparent;
  }

  void showReportCard() {
    int score = 0;
    List<String> reportDetails = [];

    // Loop through all the questions and check the answers
    for (int i = 0; i < questions.length; i++) {
      String userAnswer = userAnswers[i] ?? '';
      String correctAnswer = questions[i]['answer'] ?? '';

      // Check if the user's answer is correct
      if (userAnswer == correctAnswer) {
        score++;
        reportDetails.add('प्रश्न ${i + 1}: बरोबर');
      } else {
        reportDetails.add(
            'प्रश्न ${i + 1}: चूक (तुमचे उत्तर: $userAnswer, योग्य उत्तर: $correctAnswer)');
      }
    }

    // Show a dialog with the score and detailed report
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('प्रश्नोत्तरी पूर्ण'),
          content: SingleChildScrollView(
            // Wrap the content in SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('तुमचे गुण: $score/${questions.length}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                for (var detail in reportDetails)
                  Text(detail, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('बंद करा'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('यादृच्छिक प्रश्नोत्तरी ऍप',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[600],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SlideTransition(
            position: _offsetAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (question['image'] != null) ...[
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(question['image']),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                Text(
                  '${question['role']} प्रश्न',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800]),
                ),
                const SizedBox(height: 10),
                Text(
                  question['question'],
                  style: TextStyle(fontSize: 20, color: Colors.teal[700]),
                ),
                const SizedBox(height: 20),
                if (question['type'] == 'multiple_choice') ...[
                  ...List.generate(
                    question['options'].length,
                    (index) => ElevatedButton(
                      onPressed: () {
                        submitAnswer(question['options'][index]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            getButtonColor(question['options'][index]),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        question['options'][index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
                if (question['type'] == 'true_false') ...[
                  ElevatedButton(
                    onPressed: () {
                      submitAnswer('खरे');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getButtonColor('खरे'),
                    ),
                    child: const Text('खरे'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      submitAnswer('खोटे');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getButtonColor('खोटे'),
                    ),
                    child: const Text('खोटे'),
                  ),
                ],
                if (question['type'] == 'image_selection') ...[
                  ...List.generate(
                    question['options'].length,
                    (index) => GestureDetector(
                      onTap: () {
                        submitAnswer(question['options'][index]);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                getImageBorderColor(question['options'][index]),
                            width: 3,
                          ),
                        ),
                        child: Image.asset(question['options'][index]),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentQuestionIndex > 0)
                      ElevatedButton(
                        onPressed: () => navigateQuestion(-1),
                        child: const Text('मागील'),
                      ),
                    if (currentQuestionIndex < questions.length - 1)
                      ElevatedButton(
                        onPressed: () => navigateQuestion(1),
                        child: const Text('पुढील'),
                      ),
                    if (currentQuestionIndex == questions.length - 1)
                      ElevatedButton(
                        onPressed: showReportCard,
                        child: const Text('प्रश्नोत्तरी सबमिट करा'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
