import 'package:flutter/material.dart';
import 'models/quiz.dart';

class QuizScreen extends StatefulWidget {
  final String ageGroup;

  const QuizScreen({super.key, required this.ageGroup});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, String?> selectedOptions =
      {}; // Store selected option for each question
  TextEditingController answerController = TextEditingController();

  void answerQuestion(String selectedOption) {
    setState(() {
      selectedOptions[currentQuestionIndex] = selectedOption;
    });
    final currentQuestion =
        quizQuestions[widget.ageGroup]![currentQuestionIndex];

    if (selectedOption == currentQuestion['answer']) {
      setState(() {
        score++;
      });
    }
  }

  void answerFillInTheBlank(String userAnswer) {
    final currentQuestion =
        quizQuestions[widget.ageGroup]![currentQuestionIndex];

    setState(() {
      selectedOptions[currentQuestionIndex] = userAnswer;
    });

    if (userAnswer.trim().toLowerCase() ==
        currentQuestion['answer']!.toLowerCase()) {
      setState(() {
        score++;
      });
    }
  }

  void goToNextQuestion() {
    if (currentQuestionIndex + 1 < quizQuestions[widget.ageGroup]!.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            questions: quizQuestions[widget.ageGroup]!,
            selectedOptions: selectedOptions,
          ),
        ),
      );
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
        quizQuestions[widget.ageGroup]![currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz '),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Question ${currentQuestionIndex + 1} / ${quizQuestions[widget.ageGroup]!.length}',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text(
                currentQuestion['question'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              if (currentQuestion['type'] == 'fill-in-the-blank')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: answerController,
                      decoration: InputDecoration(
                        hintText: 'Type your answer here',
                        filled: true,
                        fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        answerFillInTheBlank(answerController.text);
                        goToNextQuestion();
                      },
                      child: Text('Submit'),
                    ),
                  ],
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: currentQuestion['options'].length,
                  itemBuilder: (context, index) {
                    String option = currentQuestion['options'][index];
                    return GestureDetector(
                      onTap: () => answerQuestion(option),
                      child: Card(
                        color: selectedOptions[currentQuestionIndex] == option
                            ? Colors.green
                            : Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            option,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: goToPreviousQuestion,
                    child: Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: goToNextQuestion,
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final List<Map<String, dynamic>> questions;
  final Map<int, String?> selectedOptions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.questions,
    required this.selectedOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Your Score: $score/${questions.length}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Review Your Answers',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final selectedAnswer = selectedOptions[index];
                  final correctAnswer = question['answer'];

                  return Card(
                    color: selectedAnswer == correctAnswer
                        ? Colors.green
                        : Colors.red,
                    child: ListTile(
                      title: Text(
                        question['question'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Answer: ${selectedAnswer ?? 'Not Answered'}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Correct Answer: $correctAnswer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
