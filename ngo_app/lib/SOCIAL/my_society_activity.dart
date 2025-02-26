import 'package:flutter/material.dart';

void main() {
  runApp(MySocietyActivityPage());
}

class MySocietyActivityPage extends StatelessWidget {
  const MySocietyActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
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
  TextEditingController textController =
      TextEditingController(); // Controller for TextField

  List<Map<String, dynamic>> questions = [
    {
      'role': 'Firefighter',
      'image': 'assets/SOCIAL/firefighter.jpg',
      'question': 'Fill in the blank: A firefighter extinguishes ____.',
      'type': 'fill_in_the_blank',
      'answer': 'fires',
    },
    {
      'role': 'Dentist',
      'image': 'assets/SOCIAL/dentist.jpg',
      'question': 'Which tool is commonly used by a dentist?',
      'type': 'multiple_choice',
      'options': ['Drill', 'Paintbrush', 'Telescope', 'Hammer'],
      'answer': 'Drill',
    },
    {
      'role': 'Engineer',
      'image': 'assets/SOCIAL/engineer.jpg',
      'question': 'True or False: Engineers do not design structures.',
      'type': 'true_false',
      'answer': 'False',
    },
    {
      'role': 'Doctor',
      'image': 'assets/SOCIAL/doctor.jpg',
      'question':
          'Which of these is used by a doctor to check a patient’s heartbeat?',
      'type': 'multiple_choice',
      'options': ['Stethoscope', 'Paintbrush', 'Calculator', 'Hammer'],
      'answer': 'Stethoscope',
    },
    {
      'role': 'Farmer',
      'image': 'assets/SOCIAL/farmer.jpg',
      'question': 'True or False: A farmer uses a plow to till the soil.',
      'type': 'true_false',
      'answer': 'True',
    },
    {
      'role': 'Teacher',
      'image': 'assets/SOCIAL/teacher.jpg',
      'question':
          'Fill in the blank: A teacher uses a ____ to educate students.',
      'type': 'fill_in_the_blank',
      'answer': 'blackboard',
    },
    {
      'role': 'Scientist',
      'image': 'assets/SOCIAL/scientist.jpg',
      'question': 'True or False: A scientist conducts experiments.',
      'type': 'true_false',
      'answer': 'True',
    },
    {
      'role': 'Police Officer',
      'question': 'Select the correct image of a Police Officer\'s tools',
      'type': 'image_selection',
      'options': [
        'assets/SOCIAL/dentist.jpg',
        'assets/SOCIAL/doctor.jpg',
        'assets/SOCIAL/police_officer.jpg'
      ],
      'answer': 'assets/SOCIAL/police_officer.jpg',
    },
    {
      'role': 'Accountant',
      'image': 'assets/SOCIAL/accountant.jpg',
      'question': 'What is the primary responsibility of an accountant?',
      'type': 'multiple_choice',
      'options': [
        'Managing finances',
        'Performing surgeries',
        'Teaching students',
        'Repairing machines'
      ],
      'answer': 'Managing finances',
    },
    {
      'role': 'Artist',
      'question': 'Select the correct image of an artist\'s tools.',
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
          content: const Text(
              'Please answer the current question before proceeding.'),
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
          textController.clear(); // Clear the text input for the next question
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

  // Implement the showReportCard method here
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
        reportDetails.add('Q${i + 1}: Correct');
      } else {
        reportDetails.add(
            'Q${i + 1}: Incorrect (Your answer: $userAnswer, Correct answer: $correctAnswer)');
      }
    }

    // Show a dialog with the score and detailed report
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Completed'),
          content: SingleChildScrollView(
            // Wrap the content in SingleChildScrollView
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your score: $score/${questions.length}',
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
              child: const Text('Close'),
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
        title: const Text('Randomized Quiz App',
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
                  '${question['role']} Question',
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
                if (question['type'] == 'fill_in_the_blank') ...[
                  TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'Your answer',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      submitAnswer(value);
                    },
                  ),
                ],
                if (question['type'] == 'true_false') ...[
                  ElevatedButton(
                    onPressed: () {
                      submitAnswer('True');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getButtonColor('True'),
                    ),
                    child: const Text('True'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      submitAnswer('False');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getButtonColor('False'),
                    ),
                    child: const Text('False'),
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
                        child: const Text('Previous'),
                      ),
                    if (currentQuestionIndex < questions.length - 1)
                      ElevatedButton(
                        onPressed: () => navigateQuestion(1),
                        child: const Text('Next'),
                      ),
                    if (currentQuestionIndex == questions.length - 1)
                      ElevatedButton(
                        onPressed: showReportCard,
                        child: const Text('Submit Quiz'),
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
