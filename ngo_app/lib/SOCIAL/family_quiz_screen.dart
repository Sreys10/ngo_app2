import 'package:flutter/material.dart';

void main() {
  runApp(FamilyQuizScreenPage());
}

class FamilyQuizScreenPage extends StatelessWidget {
  const FamilyQuizScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FamilyQuizScreen(),
    );
  }
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion(
      {required this.question,
      required this.options,
      required this.correctAnswer});
}

class FamilyQuizScreen extends StatefulWidget {
  const FamilyQuizScreen({super.key});

  @override
  _FamilyQuizScreenState createState() => _FamilyQuizScreenState();
}

class _FamilyQuizScreenState extends State<FamilyQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  final List<QuizQuestion> quizQuestions = [
    QuizQuestion(
      question: 'कुटुंबातील सर्वात महत्त्वाची मूल्य कोणती आहे?',
      options: ['विश्वास', 'पैसे', 'यश', 'स्वातंत्र्य'],
      correctAnswer: 'विश्वास',
    ),
    QuizQuestion(
      question: 'कुटुंबातील निर्णय कोण घेतो?',
      options: ['वडील', 'आई', 'दोघेही', 'मुलं'],
      correctAnswer: 'दोघेही',
    ),
    QuizQuestion(
      question: 'कुटुंबासोबत वेळ घालवणे का महत्त्वाचे आहे?',
      options: [
        'बंध निर्माण करण्यासाठी',
        'मजा करण्यासाठी',
        'विश्रांतीसाठी',
        'वरील सर्व'
      ],
      correctAnswer: 'वरील सर्व',
    ),
    QuizQuestion(
      question: 'कुटुंबातील सदस्यांनी एकमेकांना कसे समर्थन द्यावे?',
      options: ['ऐकून', 'घरकामात मदत करून', 'प्रेम दाखवून', 'वरील सर्व'],
      correctAnswer: 'वरील सर्व',
    ),
    QuizQuestion(
      question: 'कुटुंबात पालकांची भूमिका काय आहे?',
      options: [
        'मुलांची काळजी घेणे',
        'कुटुंबासाठी कमावणे',
        'मूल्य शिकवणे',
        'वरील सर्व'
      ],
      correctAnswer: 'वरील सर्व',
    ),
    QuizQuestion(
      question: 'कुटुंबातील सदस्यांनी कोणते गुण आत्मसात करायला हवेत?',
      options: ['प्रेम', 'आदर', 'सहकार्य', 'वरील सर्व'],
      correctAnswer: 'वरील सर्व',
    ),
    QuizQuestion(
      question: 'संघर्ष सोडवण्यासाठी कुटुंबाने काय करावे?',
      options: [
        'भांडण करावे',
        'एकमेकांकडे दुर्लक्ष करावे',
        'संवाद साधावा आणि तडजोड करावी',
        'एकमेकांना दोष द्यावा'
      ],
      correctAnswer: 'संवाद साधावा आणि तडजोड करावी',
    ),
    QuizQuestion(
      question: 'कुटुंबात प्रशंसा का महत्त्वाची आहे?',
      options: [
        'संबंध बळकट करण्यासाठी',
        'वाद टाळण्यासाठी',
        'इतरांना खूश करण्यासाठी',
        'वरील सर्व'
      ],
      correctAnswer: 'संबंध बळकट करण्यासाठी',
    ),
    QuizQuestion(
      question: 'मजबूत कुटुंब तयार करण्यासाठी काय आवश्यक आहे?',
      options: ['प्रेम आणि पाठिंबा', 'संवाद', 'आदर', 'वरील सर्व'],
      correctAnswer: 'वरील सर्व',
    ),
    QuizQuestion(
      question: 'कुटुंबाने सकारात्मक वातावरण कसे तयार करावे?',
      options: [
        'एकमेकांचा आदर ठेवून',
        'एकत्र वेळ घालवून',
        'एकमेकांना पाठिंबा देऊन',
        'वरील सर्व'
      ],
      correctAnswer: 'वरील सर्व',
    ),
  ];

  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == quizQuestions[currentQuestionIndex].correctAnswer) {
      setState(() {
        score++;
      });
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("कुटुंब क्विझ"),
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade300, Colors.orange.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (currentQuestionIndex < quizQuestions.length) ...[
                Text(
                  quizQuestions[currentQuestionIndex].question,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ...quizQuestions[currentQuestionIndex].options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => answerQuestion(option),
                        child: Text(
                          option,
                          style: TextStyle(color: Colors.red.shade900),
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 20),
                Text(
                  'स्कोअर: $score',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ] else ...[
                Text(
                  'क्विझ पूर्ण झाली!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
