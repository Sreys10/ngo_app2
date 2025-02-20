import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';
import 'languages/marathi/quiz_data.dart';
import 'languages/english/quiz_data.dart';
import 'languages/hindi/quiz_data.dart';

class QuizScreen extends StatefulWidget {
  final String language;

  const QuizScreen({super.key, required this.language});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Map<String, dynamic>> quizQuestions;
  int currentQuestionIndex = 0;
  int score = 0;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadQuizQuestions();
  }

  void _loadQuizQuestions() {
    switch (widget.language) {
      case 'marathi':
        quizQuestions = marathiQuizQuestions;
        break;
      case 'english':
        quizQuestions = englishQuizQuestions;
        break;
      case 'hindi':
        quizQuestions = hindiQuizQuestions;
        break;
    }
  }

  void _checkAnswer(int selectedOption) {
    if (selectedOption == quizQuestions[currentQuestionIndex]["answer"]) {
      score++;
      audioPlayer.play(AssetSource('PD/audios/correct-6033.mp3'));
      setState(() {});
    } else {
      audioPlayer
          .play(AssetSource('PD/audios/buzzer-or-wrong-answer-20582.mp3'));
    }

    if (currentQuestionIndex < quizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    String comment;
    if (score >= quizQuestions.length * 0.8) {
      comment = widget.language == 'marathi'
          ? 'अभिनंदन! तुमचे ज्ञान प्रभावी आहे!'
          : widget.language == 'hindi'
              ? 'बधाई! आपका ज्ञान प्रभावशाली है!'
              : 'Congratulations! Your knowledge is impressive!';
    } else {
      comment = widget.language == 'marathi'
          ? 'सराव करा आणि सुधारणा करा!'
          : widget.language == 'hindi'
              ? 'अभ्यास करें और सुधार करें!'
              : 'Practice and improve!';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            widget.language == 'marathi'
                ? 'निकाल'
                : widget.language == 'hindi'
                    ? 'परिणाम'
                    : 'Result',
            style: TextStyle(
              color: const Color.fromARGB(150, 221, 59, 59),
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '${widget.language == 'marathi' ? 'तुमचा गुण' : widget.language == 'hindi' ? 'आपका स्कोर' : 'Your score'}: $score/${quizQuestions.length}\n$comment',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'OK',
                style: TextStyle(color: const Color.fromARGB(150, 221, 59, 59)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.language == 'marathi'
              ? 'क्विज'
              : widget.language == 'hindi'
                  ? 'क्विज'
                  : 'Quiz',
        ),
        backgroundColor: const Color.fromARGB(150, 221, 59, 59),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                quizQuestions[currentQuestionIndex]["image"],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Question Text
            Text(
              quizQuestions[currentQuestionIndex]["question"],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(150, 221, 59, 59),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Options Buttons
            ...(quizQuestions[currentQuestionIndex]["options"] as List<String>)
                .map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(
                      quizQuestions[currentQuestionIndex]["options"]
                          .indexOf(option)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(150, 221, 59, 59),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),

            // Lottie Animation for Correct Answers
            if (score > 0 && score == currentQuestionIndex + 1)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Lottie.asset(
                  'assets/PD/animations/Animation - 1737626799208.gif',
                  height: 150,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
