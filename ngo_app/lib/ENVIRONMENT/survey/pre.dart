import 'package:flutter/material.dart';

class PreTestPage extends StatefulWidget {
  const PreTestPage({super.key});

  @override
  _PreTestPageState createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestPage> {
  List<String?> userAnswers = List.filled(10, null);
  bool showAnswers = false;
  final ScrollController _scrollController =
      ScrollController(); // Add ScrollController

  final List<String> correctAnswers = [
    'b',
    'a',
    'c',
    'b',
    'b',
    'a',
    'b',
    'b',
    'a',
    'a'
  ];

  final List<String> explanations = [
    'पर्यावरणीय स्त्रोत म्हणजे पर्यावरणातील घटक जे जीवनासाठी उपयुक्त असतात, जसे की पाणी, हवा, माती, वनस्पती, इ.',
    'पर्यावरणीय स्त्रोतांचा योग्य वापर नैसर्गिक संपत्तीचे रक्षण करण्यासाठी आणि भविष्यातील पिढ्यांसाठी त्यांची उपलब्धता सुनिश्चित करण्यासाठी महत्त्वाचा आहे.',
    'कार्बन फूटप्रिंट म्हणजे मानवी क्रियांमुळे उत्सर्जित होणाऱ्या कार्बन डायऑक्साइडचे प्रमाण, जे पर्यावरणावर परिणाम करते.',
    'उर्जेचा अपव्यय टाळण्यासाठी पंखे आणि दिवे बंद करणे, जेव्हा गरज नसते तेव्हा, ही सवय उपयुक्त ठरते.',
    'पुनर्वापर म्हणजे प्लास्टिक आणि कागद वेगळे करून त्याचा वापर नवीन उत्पादनासाठी करणे, ज्यामुळे कचऱ्याचे प्रमाण कमी होते.',
    'कचऱ्याचे वर्गीकरण महत्त्वाचे आहे कारण त्यामुळे कचऱ्यातील पुनर्वापरासाठी योग्य वस्तू वेगळ्या करता येतात.',
    'प्लास्टिकचा पुनर्वापर जुने प्लास्टिक वितळवून नवीन उत्पादन तयार करून करता येतो.',
    'ओला कचरा अन्नाचा उरलेला भाग असतो, तर सुका कचरा प्लास्टिक व कागद असतो.',
    'जैविक कचऱ्यापासून खत तयार करण्याची प्रक्रिया म्हणजे जैविक कचऱ्याचे कंपोस्टिंग करून खत तयार करणे.',
    'पर्यावरणीय व्यवस्थापनाचे उद्दिष्ट पर्यावरणीय स्त्रोतांचा योग्य वापर आणि संरक्षण करणे आहे.'
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
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.green : Colors.black87,
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
    'पर्यावरणीय स्त्रोत म्हणजे काय? उदाहरणे द्या.',
    'पर्यावरणीय स्त्रोतांचा योग्य वापर का महत्त्वाचा आहे?',
    'कार्बन फूटप्रिंट म्हणजे काय?',
    'उर्जेचा अपव्यय टाळण्यासाठी कोणत्या सवयी उपयोगी ठरतात?',
    'पुनर्वापर (Recycling) कसा करता येतो? उदाहरण द्या.',
    'कचऱ्याचे वर्गीकरण का महत्त्वाचे आहे?',
    'प्लास्टिकचा पुनर्वापर कसा करता येईल?',
    'ओला आणि सुका कचरा यामध्ये काय फरक आहे?',
    'जैविक कचऱ्यापासून खत तयार करण्याची प्रक्रिया काय आहे?',
    'पर्यावरणीय व्यवस्थापनाचे उद्दिष्ट काय आहे?',
  ];

  final List<List<String>> options = [
    [
      'a) वीज वाचविण्याचे उपाय',
      'b) पर्यावरणातील घटक जे जीवनासाठी उपयुक्त असतात',
      'c) ओला कचऱ्याचा पुनर्वापर',
      'd) जैविक खत तयार करणे'
    ],
    [
      'a) नैसर्गिक संपत्तीचे रक्षण करण्यासाठी',
      'b) पाण्याचा अपव्यय वाढविण्यासाठी',
      'c) कार्बन फूटप्रिंट वाढविण्यासाठी',
      'd) कचऱ्याचा वर्गीकरण टाळण्यासाठी'
    ],
    [
      'a) कचऱ्याची विल्हेवाट लावण्याची पद्धत',
      'b) वायुप्रदूषणाचे प्रमाण',
      'c) मानवी क्रियांमुळे उत्सर्जित होणाऱ्या कार्बन डायऑक्साइडचे प्रमाण',
      'd) जैविक कचऱ्याचे खत'
    ],
    [
      'a) दिवे चालू ठेवणे',
      'b) पंखे बंद करणे जेव्हा गरज नसते',
      'c) नळ चालू ठेवणे',
      'd) वीज जास्त वापरणे'
    ],
    [
      'a) कचरा जाळून',
      'b) प्लास्टिक आणि कागद वेगळे करून त्याचा वापर नवीन उत्पादनासाठी करणे',
      'c) सर्व कचरा एकत्र टाकून',
      'd) नवीन वस्तू खरेदी करून'
    ],
    [
      'a) कचऱ्यातील पुनर्वापरासाठी योग्य वस्तू वेगळ्या करता येतात',
      'b) कचऱ्याचा ढीग तयार करण्यासाठी',
      'c) प्लास्टिकचा अपव्यय करण्यासाठी',
      'd) नैसर्गिक स्त्रोत संपवण्यासाठी'
    ],
    [
      'a) प्लास्टिकचा कचरा नदीत टाकून',
      'b) जुने प्लास्टिक वितळवून नवीन उत्पादन तयार करून',
      'c) प्लास्टिक जाळून',
      'd) प्लास्टिकचा उपेक्षा करून'
    ],
    [
      'a) ओला कचरा पाण्यात टाकतात, सुका कचरा जाळतात',
      'b) ओला कचरा अन्नाचा उरलेला भाग असतो, सुका कचरा प्लास्टिक व कागद असतो',
      'c) सुका कचरा फेकून देतात, ओला कचरा साठवतात',
      'd) ओला कचरा नैसर्गिक आहे, सुका कचरा नैसर्गिक नाही'
    ],
    [
      'a) जैविक कचऱ्याचे कंपोस्टिंग करून खत तयार करणे',
      'b) जैविक कचऱ्याला जाळून टाकणे',
      'c) जैविक कचऱ्याचे वर्गीकरण टाळणे',
      'd) जैविक कचऱ्याचा निचरा न करणे'
    ],
    [
      'a) पर्यावरणीय स्त्रोतांचा योग्य वापर आणि संरक्षण',
      'b) स्त्रोतांचा जास्तीत जास्त वापर',
      'c) कार्बन फूटप्रिंट वाढविणे',
      'd) कचऱ्याचे वर्गीकरण थांबवणे'
    ],
  ];
}
