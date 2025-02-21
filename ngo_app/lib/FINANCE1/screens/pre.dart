import 'package:flutter/material.dart';

class PreTestScreen extends StatefulWidget {
  const PreTestScreen({super.key});

  @override
  _PreTestPageState createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestScreen> {
  List<String?> userAnswers = List.filled(10, null);
  bool showAnswers = false;
  final ScrollController _scrollController = ScrollController();

  final List<String> correctAnswers = [
    'c', // मागणी आणि पुरवठा
    'c', // रोख रक्कम आणि इतर पर्याय
    'c', // आर्थिक व्यवस्थापन करणे
    'c', // उत्पन्न आणि खर्च दोन्ही
    'c', // भविष्यात फायदा मिळावा यासाठी पैसे गुंतवणे
    'c', // भविष्यातील गरजांसाठी
    'b', // पैसे घेणे आणि परत करणे
    'c', // व्याजदर आणि परतफेड करण्याची मुदत दोन्ही
    'b', // दुसऱ्यासाठी काम करणे
    'b', // स्वतःचा व्यवसाय सुरू करणे
  ];

  final List<String> explanations = [
    'जत्रेत वस्तूंची किंमत मागणी आणि पुरवठ्याच्या तत्त्वावर ठरते, कारण मागणी जास्त असेल आणि पुरवठा कमी असेल तर किंमत वाढते आणि उलटही.',
    'जत्रेत वस्तू रोख रक्कम आणि इतर पर्यायांनी (उदा. डिजिटल पेमेंट) विकल्या जाऊ शकतात, हे स्थान आणि सुविधांवर अवलंबून असते.',
    'कौटुंबिक अंदाजपत्रकाचा मुख्य उद्देश आर्थिक व्यवस्थापन करणे हा आहे, ज्यामुळे खर्च आणि बचत यांचा समतोल राखता येतो.',
    'अंदाजपत्रकात उत्पन्न आणि खर्च दोन्ही समाविष्ट असतात, कारण हे दोन्ही घटक आर्थिक नियोजनासाठी महत्त्वाचे आहेत.',
    'गुंतवणूक म्हणजे भविष्यात फायदा मिळावा यासाठी पैसे गुंतवणे, जसे की शेअर्स, म्युच्युअल फंड्स किंवा जमीन खरेदी.',
    'बचत करणे भविष्यातील गरजांसाठी महत्त्वाचे आहे, जसे की आपत्कालीन परिस्थिती किंवा मोठे खर्च पूर्ण करण्यासाठी.',
    'कर्ज म्हणजे पैसे घेणे आणि ठरलेल्या कालावधीत परत करणे, ज्यामध्ये व्याजदराचा समावेश असतो.',
    'कर्ज घेताना व्याजदर आणि परतफेड करण्याची मुदत दोन्ही लक्षात घ्यावे लागते, कारण यावर कर्जाची एकूण किंमत अवलंबून असते.',
    'नोकरी म्हणजे दुसऱ्यासाठी काम करणे आणि त्याबदल्यात पगार मिळवणे, हे स्वतःचा व्यवसाय करण्यापेक्षा वेगळे आहे.',
    'उद्यमशीलता म्हणजे स्वतःचा व्यवसाय सुरू करणे आणि त्यातून नफा कमावण्याचा प्रयत्न करणे.'
  ];

  void _checkAnswers() {
    int score = 0;
    for (int i = 0; i < correctAnswers.length; i++) {
      if (userAnswers[i] == correctAnswers[i]) {
        score++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          'परिणाम',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 175, 76, 92)),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'तुम्ही $score पैकी ${correctAnswers.length} गुण मिळवले.',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 142, 56, 75),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(() {
                  showAnswers = true;
                });
                Navigator.pop(context);
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: const Text(
                'उत्तर पहा',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'बंद करा',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 175, 76, 96)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerReview(int index) {
    String userAnswer = userAnswers[index] ?? 'उत्तर दिलेले नाही';
    String correctAnswer = correctAnswers[index];
    bool isCorrect = userAnswer == correctAnswer;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'तुम्ही दिलेले उत्तर: $userAnswer',
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (!isCorrect) ...[
            const SizedBox(height: 8),
            Text(
              'योग्य उत्तर: $correctAnswer',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            'स्पष्टीकरण: ${explanations[index]}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'प्री-टेस्ट सर्वे',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 142, 56, 60),
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.greenAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade50, Colors.white],
          ),
        ),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: userAnswers.where((e) => e != null).length /
                  correctAnswers.length,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                  const Color.fromARGB(255, 142, 56, 82)),
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: correctAnswers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _buildQuestion(
                          index + 1, questions[index], options[index]),
                      const SizedBox(height: 20),
                      if (showAnswers) _buildAnswerReview(index),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            if (!showAnswers)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 142, 56, 73),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: const Color.fromARGB(255, 240, 105, 143),
                ),
                onPressed: _checkAnswers,
                child: const Text(
                  'सबमिट करा',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            const SizedBox(height: 10),
            if (showAnswers)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.redAccent,
                ),
                onPressed: () {
                  setState(() {
                    showAnswers = false;
                    userAnswers = List.filled(10, null);
                  });
                },
                child: const Text(
                  'पुन्हा प्रयत्न करा',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(
      int questionNumber, String question, List<String> options) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'प्रश्न $questionNumber: $question',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 175, 76, 87),
              ),
            ),
            const SizedBox(height: 10),
            ...options.map((option) {
              bool isSelected =
                  userAnswers[questionNumber - 1] == option.split(')')[0];
              return GestureDetector(
                onTap: showAnswers
                    ? null
                    : () {
                        setState(() {
                          userAnswers[questionNumber - 1] =
                              option.split(')')[0];
                        });
                      },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Colors.green.shade100 : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? const Color.fromARGB(255, 160, 67, 84)
                          : Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected
                                ? const Color.fromARGB(255, 175, 76, 89)
                                : Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  final List<String> questions = [
    'जत्रेत वस्तूंची किंमत कोण ठरवतो?',
    'जत्रेत वस्तू कशा विकल्या जातात?',
    'कौटुंबिक अंदाजपत्रकाचा मुख्य उद्देश काय आहे?',
    'अंदाजपत्रकात काय समाविष्ट असते?',
    'गुंतवणूक म्हणजे काय?',
    'बचत करणे का महत्त्वाचे आहे?',
    'कर्ज म्हणजे काय?',
    'कर्ज घेताना काय लक्षात घ्यावे लागते?',
    'नोकरी म्हणजे काय?',
    'उद्यमशीलता म्हणजे काय?',
  ];

  final List<List<String>> options = [
    [
      'a) फक्त दुकानदार',
      'b) फक्त ग्राहक',
      'c) मागणी आणि पुरवठा',
      'd) सरकार',
    ],
    [
      'a) फक्त ऑनलाइन',
      'b) फक्त रोख रक्कम',
      'c) रोख रक्कम आणि इतर पर्याय',
      'd) फक्त क्रेडिट कार्ड',
    ],
    [
      'a) जास्त खर्च करणे',
      'b) बचत कमी करणे',
      'c) आर्थिक व्यवस्थापन करणे',
      'd) कर्ज घेणे',
    ],
    [
      'a) फक्त उत्पन्न',
      'b) फक्त खर्च',
      'c) उत्पन्न आणि खर्च दोन्ही',
      'd) फक्त कर्ज',
    ],
    [
      'a) पैसे खर्च करणे',
      'b) पैसे वाचवणे',
      'c) भविष्यात फायदा मिळावा यासाठी पैसे गुंतवणे',
      'd) पैसे दान करणे',
    ],
    [
      'a) फक्त मजा करण्यासाठी',
      'b) फक्त खर्च करण्यासाठी',
      'c) भविष्यातील गरजांसाठी',
      'd) इतरांना देण्यासाठी',
    ],
    [
      'a) पैसे देणे',
      'b) पैसे घेणे आणि परत करणे',
      'c) पैसे वाचवणे',
      'd) पैसे दान करणे',
    ],
    [
      'a) फक्त व्याजदर',
      'b) फक्त परतफेड करण्याची मुदत',
      'c) व्याजदर आणि परतफेड करण्याची मुदत दोन्ही',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) स्वतःचा व्यवसाय करणे',
      'b) दुसऱ्यासाठी काम करणे',
      'c) पैसे दान करणे',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) नोकरी करणे',
      'b) स्वतःचा व्यवसाय सुरू करणे',
      'c) पैसे वाचवणे',
      'd) यापैकी काहीही नाही',
    ],
  ];
}
