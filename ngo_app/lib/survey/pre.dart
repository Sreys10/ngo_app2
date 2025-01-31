import 'package:flutter/material.dart';

class PreTestPage extends StatefulWidget {
  const PreTestPage({super.key});

  @override
  _PreTestPageState createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestPage> {
  // List to store user answers
  List<String?> userAnswers = List.filled(10, null);

  // List of correct answers
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

  // Function to check answers
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
        title:
            const Text('Result', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text(
          'You scored $score out of ${correctAnswers.length}',
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pre-Test Survey',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
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
        child: ListView(
          children: [
            _buildQuestion(
              1,
              'पर्यावरणीय स्त्रोत म्हणजे काय? उदाहरणे द्या.',
              [
                'a) वीज वाचविण्याचे उपाय',
                'b) पर्यावरणातील घटक जे जीवनासाठी उपयुक्त असतात',
                'c) ओला कचऱ्याचा पुनर्वापर',
                'd) जैविक खत तयार करणे'
              ],
            ),
            _buildQuestion(
              2,
              'पर्यावरणीय स्त्रोतांचा योग्य वापर का महत्त्वाचा आहे?',
              [
                'a) नैसर्गिक संपत्तीचे रक्षण करण्यासाठी',
                'b) पाण्याचा अपव्यय वाढविण्यासाठी',
                'c) कार्बन फूटप्रिंट वाढविण्यासाठी',
                'd) कचऱ्याचा वर्गीकरण टाळण्यासाठी'
              ],
            ),
            _buildQuestion(
              3,
              'कार्बन फूटप्रिंट म्हणजे काय?',
              [
                'a) कचऱ्याची विल्हेवाट लावण्याची पद्धत',
                'b) वायुप्रदूषणाचे प्रमाण',
                'c) मानवी क्रियांमुळे उत्सर्जित होणाऱ्या कार्बन डायऑक्साइडचे प्रमाण',
                'd) जैविक कचऱ्याचे खत'
              ],
            ),
            _buildQuestion(
              4,
              'उर्जेचा अपव्यय टाळण्यासाठी कोणत्या सवयी उपयोगी ठरतात?',
              [
                'a) दिवे चालू ठेवणे',
                'b) पंखे बंद करणे जेव्हा गरज नसते',
                'c) नळ चालू ठेवणे',
                'd) वीज जास्त वापरणे'
              ],
            ),
            _buildQuestion(
              5,
              'पुनर्वापर (Recycling) कसा करता येतो? उदाहरण द्या.',
              [
                'a) कचरा जाळून',
                'b) प्लास्टिक आणि कागद वेगळे करून त्याचा वापर नवीन उत्पादनासाठी करणे',
                'c) सर्व कचरा एकत्र टाकून',
                'd) नवीन वस्तू खरेदी करून'
              ],
            ),
            _buildQuestion(
              6,
              'कचऱ्याचे वर्गीकरण का महत्त्वाचे आहे?',
              [
                'a) कचऱ्यातील पुनर्वापरासाठी योग्य वस्तू वेगळ्या करता येतात',
                'b) कचऱ्याचा ढीग तयार करण्यासाठी',
                'c) प्लास्टिकचा अपव्यय करण्यासाठी',
                'd) नैसर्गिक स्त्रोत संपवण्यासाठी'
              ],
            ),
            _buildQuestion(
              7,
              'प्लास्टिकचा पुनर्वापर कसा करता येईल?',
              [
                'a) प्लास्टिकचा कचरा नदीत टाकून',
                'b) जुने प्लास्टिक वितळवून नवीन उत्पादन तयार करून',
                'c) प्लास्टिक जाळून',
                'd) प्लास्टिकचा उपेक्षा करून'
              ],
            ),
            _buildQuestion(
              8,
              'ओला आणि सुका कचरा यामध्ये काय फरक आहे?',
              [
                'a) ओला कचरा पाण्यात टाकतात, सुका कचरा जाळतात',
                'b) ओला कचरा अन्नाचा उरलेला भाग असतो, सुका कचरा प्लास्टिक व कागद असतो',
                'c) सुका कचरा फेकून देतात, ओला कचरा साठवतात',
                'd) ओला कचरा नैसर्गिक आहे, सुका कचरा नैसर्गिक नाही'
              ],
            ),
            _buildQuestion(
              9,
              'जैविक कचऱ्यापासून खत तयार करण्याची प्रक्रिया काय आहे?',
              [
                'a) जैविक कचऱ्याचे कंपोस्टिंग करून खत तयार करणे',
                'b) जैविक कचऱ्याला जाळून टाकणे',
                'c) जैविक कचऱ्याचे वर्गीकरण टाळणे',
                'd) जैविक कचऱ्याचा निचरा न करणे'
              ],
            ),
            _buildQuestion(
              10,
              'पर्यावरणीय व्यवस्थापनाचे उद्दिष्ट काय आहे?',
              [
                'a) पर्यावरणीय स्त्रोतांचा योग्य वापर आणि संरक्षण',
                'b) स्त्रोतांचा जास्तीत जास्त वापर',
                'c) कार्बन फूटप्रिंट वाढविणे',
                'd) कचऱ्याचे वर्गीकरण थांबवणे'
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _checkAnswers,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.greenAccent,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
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
                  color: Colors.green),
            ),
            const SizedBox(height: 10),
            ...options.map((option) => RadioListTile<String>(
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  value: option.split(')')[0],
                  groupValue: userAnswers[questionNumber - 1],
                  onChanged: (value) {
                    setState(() {
                      userAnswers[questionNumber - 1] = value;
                    });
                  },
                  activeColor: Colors.green,
                  tileColor: Colors.green.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
