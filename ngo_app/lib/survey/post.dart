import 'package:flutter/material.dart';

class PostTestPage extends StatefulWidget {
  const PostTestPage({super.key});

  @override
  _PostTestPageState createState() => _PostTestPageState();
}

class _PostTestPageState extends State<PostTestPage> {
  List<String?> userAnswers = List.filled(10, null);

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
          'Result',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'You scored $score out of ${correctAnswers.length}',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(fontSize: 16, color: Colors.green),
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
          'Post-Test Survey',
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
                padding: const EdgeInsets.all(8),
                itemCount: correctAnswers.length,
                itemBuilder: (context, index) {
                  return _buildQuestion(
                      index + 1, questions[index], options[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
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
                'Submit',
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
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q$questionNumber: $question',
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
                onTap: () {
                  setState(() {
                    userAnswers[questionNumber - 1] = option.split(')')[0];
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green.shade100 : Colors.white,
                    border: Border.all(
                      color: isSelected
                          ? Colors.green.shade700
                          : Colors.grey.shade300,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: isSelected ? Colors.green.shade700 : Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected
                                ? Colors.green.shade700
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
}

final List<String> questions = [
  'तुम्ही पर्यावरणीय स्त्रोत जपण्यासाठी कोणत्या पद्धती अमलात आणू शकता?',
  'तुमचा कार्बन फूटप्रिंट कमी करण्यासाठी तुम्ही कोणते बदल करू शकता?',
  'उर्जेची बचत करण्यासाठी तुमच्या घरामध्ये कोणते उपाय करता येतील?',
  'पाण्याचा अपव्यय टाळण्यासाठी कोणते उपाय आहेत?',
  'कचऱ्याचे योग्य व्यवस्थापन का महत्त्वाचे आहे?',
  'तुम्ही अनावश्यक कपडे किंवा प्लास्टिक कसे पुनर्वापर करू शकता?',
  'तुमच्या समाजामध्ये पुनर्वापर आणि कचरा व्यवस्थापन सुधारण्यासाठी तुम्ही काय कराल?',
  'जैविक कचऱ्याचे खत कसे तयार करता येईल?',
  'मुलींनी वापरलेल्या सॅनिटरी पॅड्सची विल्हेवाट कशी लावावी?',
  'तुम्ही पर्यावरण संवर्धनासाठी आणखी कोणते उपक्रम राबवू शकता?',
];

final List<List<String>> options = [
  [
    'a) प्लास्टिक जास्त वापरणे',
    'b) नैसर्गिक स्त्रोतांचा अपव्यय करणे',
    'c) स्त्रोतांचे पुनर्वापर आणि जतन करणे',
    'd) पाण्याचा अपव्यय करणे'
  ],
  [
    'a) सौर उर्जेचा वापर करणे',
    'b) वाहनांचा अपव्यय करणे',
    'c) कोळशाचा जास्तीत जास्त वापर करणे',
    'd) पाण्याचा अपव्यय वाढवणे'
  ],
  [
    'a) दिवे आणि पंखे चालू ठेवणे',
    'b) विजेची उपकरणे फक्त गरज असेल तेव्हाच वापरणे',
    'c) विजेचा अनावश्यक वापर करणे',
    'd) मोठ्या प्रमाणावर विजेचा अपव्यय करणे'
  ],
  [
    'a) गळके नळ दुरुस्त करणे',
    'b) पाण्याचा अनावश्यक वापर करणे',
    'c) पाण्याचा अपव्यय करण्यासाठी मोठे टाक्या वापरणे',
    'd) वाहत्या पाण्याला चालू ठेवणे'
  ],
  [
    'a) कचऱ्यामुळे प्रदूषण कमी होते',
    'b) कचऱ्यातील उपयोगी गोष्टींचा पुनर्वापर करता येतो',
    'c) कचऱ्याचा ढीग तयार करण्यासाठी',
    'd) पर्यावरणासाठी हानिकारक असते'
  ],
  [
    'a) फेकून देऊन',
    'b) गरजूंना देऊन किंवा नवीन वस्तू तयार करून',
    'c) जाळून टाकून',
    'd) कोणताही उपाय न करता'
  ],
  [
    'a) जनजागृती करून आणि लोकांना शिक्षित करून',
    'b) कचऱ्याचा ढीग तयार करण्यासाठी प्रोत्साहन देऊन',
    'c) सर्व कचरा एकाच ठिकाणी टाकून',
    'd) प्लास्टिकचा अपव्यय करून'
  ],
  [
    'a) कचऱ्याला एका खड्ड्यात टाकून सडवणे',
    'b) जैविक कचरा जाळून टाकणे',
    'c) प्लास्टिक कचऱ्याचा वापर करून',
    'd) कचऱ्याला कोणतेही व्यवस्थापन न करता टाकणे'
  ],
  [
    'a) रस्त्यावर टाकून देऊन',
    'b) योग्य प्रकारे संकलन व जळणाऱ्या कचऱ्यात वर्गीकरण करून',
    'c) इतर कचऱ्यात मिसळून',
    'd) पाण्यात टाकून'
  ],
  [
    'a) झाडे लावणे आणि लोकांना प्रोत्साहन देणे',
    'b) प्लास्टिक पिशव्यांचा अधिक वापर करणे',
    'c) कचऱ्याचा वर्गीकरण टाळणे',
    'd) पर्यावरणीय स्त्रोतांचा जास्तीत जास्त उपभोग करणे'
  ]
];
