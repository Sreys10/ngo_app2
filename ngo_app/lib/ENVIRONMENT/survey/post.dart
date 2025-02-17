import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PostTestPage(),
    );
  }
}

class PostTestPage extends StatefulWidget {
  const PostTestPage({super.key});

  @override
  _PostTestPageState createState() => _PostTestPageState();
}

class _PostTestPageState extends State<PostTestPage> {
  List<String?> userAnswers = List.filled(10, null);
  bool showAnswers = false;
  final ScrollController _scrollController =
      ScrollController(); // Add ScrollController

  final List<String> correctAnswers = [
    'c',
    'a',
    'b',
    'a',
    'b',
    'b',
    'a',
    'a',
    'b',
    'a'
  ];

  final List<String> explanations = [
    'संसाधन पुनर्वापर आणि संरक्षण हे पर्यावरण संरक्षणासाठी महत्त्वाचे आहे.',
    'सौर ऊर्जा ही एक नैतिक आणि प्रदूषणमुक्त ऊर्जा स्रोत आहे.',
    'केवळ आवश्यकता असताना वीज उपकरणे वापरणे ऊर्जा वाचवते.',
    'पाणी गळती रोखून पाणी वाया जाणे टाळता येते.',
    'कचऱ्यापासून उपयोगी वस्त्रांचा पुनर्वापर नवीन वस्त्रांमध्ये केला जाऊ शकतो.',
    'जुन्या कपड्यांचे आणि प्लॅस्टिकचे पुनर्वापर पर्यावरण रक्षणासाठी महत्त्वाचे आहे.',
    'कचऱ्याचे व्यवस्थापन सुधारण्यासाठी जनजागृती आणि शिक्षण आवश्यक आहे.',
    'सेंद्रिय कचरा नैतिक कंपोस्टमध्ये रूपांतरित केला जाऊ शकतो.',
    'सॅनिटरी पॅड्सचा योग्य विल्हेवाट आवश्यक आहे.',
    'झाडे लावणे आणि जनजागृती पर्यावरण संरक्षणासाठी महत्त्वपूर्ण उपक्रम आहेत.'
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
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
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
                backgroundColor: Colors.green.shade700,
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
                    curve: Curves.easeInOut); // Scroll to top
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
              style: TextStyle(fontSize: 16, color: Colors.green),
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
              Text(
                'तुम्ही दिलेले उत्तर: $userAnswer',
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
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
            ),
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
          'पोस्ट-टेस्ट सर्वे',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green.shade700,
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
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green.shade700),
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                controller: _scrollController, // Attach ScrollController
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
                  backgroundColor: Colors.green.shade700,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.greenAccent,
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
                color: Colors.green,
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
                          ? Colors.green.shade600
                          : Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.green : Colors.black87,
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
    'तुम्ही पर्यावरण वाचवण्यासाठी कोणते उपाय वापरू इच्छिता?',
    'तुम्ही कोणत्या प्रकारे ऊर्जा वाचवू शकता?',
    'तुम्ही घरातील ऊर्जा कार्यक्षमता कशी सुधारू शकता?',
    'तुम्ही पाणी वाचवण्यासाठी काय करू इच्छिता?',
    'तुम्ही कचरा कसा कमी करू शकता?',
    'तुम्ही पुनर्वापर करण्यासाठी काय निवडू इच्छिता?',
    'तुम्ही पर्यावरणासंबंधी जागरूकता कशी वाढवू शकता?',
    'तुम्ही जैविक कचरा कसा व्यवस्थापित करू शकता?',
    'तुम्ही सॅनिटरी पॅड्ससाठी कोणते उपाय करू इच्छिता?',
    'तुम्ही पर्यावरण रक्षणासाठी कोणते उपक्रम सुरू करू इच्छिता?',
  ];

  final List<List<String>> options = [
    [
      'a) ऊर्जा वाचवणे',
      'b) वृक्षारोपण करणे',
      'c) पुनर्वापर आणि संरक्षण',
      'd) वीज बचत'
    ],
    [
      'a) सौर ऊर्जा वापरणे',
      'b) गॅसवरील निर्बंध करणे',
      'c) सायकल वापरणे',
      'd) प्लॅस्टिकचे पुनर्वापर'
    ],
    [
      'a) घराचे इन्सुलेशन सुधारणे',
      'b) वीज उपकरणे बंद करणे',
      'c) डक्टवर्क सुधारणे',
      'd) वीज वापरणे'
    ],
    [
      'a) टाकी दुरुस्त करणे',
      'b) गळती थांबवणे',
      'c) संकलन करणे',
      'd) कमी वेळ वापरणे'
    ],
    [
      'a) पुनर्नवीनीकरण',
      'b) कचरा कमी करणे',
      'c) कचऱ्याचे विल्हेवाट लावणे',
      'd) कचरा गोळा करणे'
    ],
    [
      'a) कागदाचा पुनर्वापर',
      'b) प्लॅस्टिक फ्री जीवन',
      'c) कमी वस्त्रांची खरेदी',
      'd) जुन्या कपड्यांचा पुनर्वापर'
    ],
    [
      'a) शाळेत जागरूकता चालवणे',
      'b) सरकारी धोरण लागू करणे',
      'c) ऑनलाइन शॉपिंग बंद करणे',
      'd) जनजागृती साधणे'
    ],
    [
      'a) हर्बल कंपोस्ट',
      'b) वनस्पतींचा नाश',
      'c) जैविक कचरा नष्ट करणे',
      'd) वनस्पती पाणी देणे'
    ],
    [
      'a) विशेष पॅड कचऱ्यात टाकणे',
      'b) पुनर्वापर करणे',
      'c) सॅनिटरी पॅड फुकट वितरित करणे',
      'd) पॅड लांब ठेवणे'
    ],
    [
      'a) झाडे लावणे',
      'b) कचरा गोळा करणे',
      'c) पर्यावरण संरक्षणासाठी समुदाय तयार करणे',
      'd) कचऱ्याची विल्हेवाट लावणे'
    ],
  ];
}
