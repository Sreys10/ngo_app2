import 'package:flutter/material.dart';

void main() {
  runApp(const RainbowDietQuizApp());
}

class RainbowDietQuizApp extends StatelessWidget {
  const RainbowDietQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'इंद्रधनुष्य आहार प्रश्नमंजुषा',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CategorySelectionPage(),
    );
  }
}

class CategorySelectionPage extends StatelessWidget {
  const CategorySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('रंग श्रेणी निवडा'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RainbowDietQuizPage(color: Colors.red),
                  ),
                );
              },
              child: const Text(
                'लाल',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RainbowDietQuizPage(color: Colors.orange),
                  ),
                );
              },
              child: const Text(
                'नारंगी',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RainbowDietQuizPage(color: Colors.yellow),
                  ),
                );
              },
              child: const Text(
                'पिवळा',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RainbowDietQuizPage(color: Colors.green),
                  ),
                );
              },
              child: const Text(
                'हिरवा',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RainbowDietQuizPage(color: Colors.blue),
                  ),
                );
              },
              child: const Text(
                'निळा',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RainbowDietQuizPage extends StatefulWidget {
  final Color color;
  const RainbowDietQuizPage({super.key, required this.color});

  @override
  State<RainbowDietQuizPage> createState() => _RainbowDietQuizPageState();
}

class _RainbowDietQuizPageState extends State<RainbowDietQuizPage> {
  int _score = 0;
  int _currentQuestionIndex = 0;
  bool _showFeedback = false;
  String _feedback = '';
  String _correctAnswer = '';
  String _feedbackExplanation = '';

  final Map<Color, List<Map<String, dynamic>>> _quizData = {
    Colors.red: [
      {
        'question': 'लाल फळे आणि भाज्यांमध्ये कोणते पोषक तत्त्व मुबलक आहे?',
        'options': ['व्हिटॅमिन C', 'बीटा-कॅरोटीन', 'पोटॅशियम', 'लोह'],
        'answer': 'व्हिटॅमिन C',
        'explanation':
            'संत्र्यासारखी लाल फळे व्हिटॅमिन C ने समृद्ध असतात, जे रोगप्रतिकारक शक्ती वाढवण्यास मदत करते.'
      },
      {
        'question': 'लाल शिमला मिरचीचा मुख्य फायदा काय आहे?',
        'options': [
          'लोहाने समृद्ध',
          'व्हिटॅमिन C ने जास्त',
          'पचनासाठी चांगले',
          'प्रथिनांनी समृद्ध'
        ],
        'answer': 'व्हिटॅमिन C ने जास्त',
        'explanation':
            'लाल शिमला मिरची व्हिटॅमिन C ने जास्त असते, जे रोगप्रतिकारक शक्ती वाढवण्यात मदत करते.'
      },
      {
        'question': 'कोणते लाल फळ हृदयाच्या आरोग्यासाठी मदत करते?',
        'options': ['सफरचंद', 'डाळिंब', 'स्ट्रॉबेरी', 'टोमॅटो'],
        'answer': 'स्ट्रॉबेरी',
        'explanation':
            'स्ट्रॉबेरीमध्ये अँटिऑक्सिडंट्स असतात जे हृदयरोगांचा धोका कमी करण्यास मदत करतात.'
      },
      {
        'question': 'कोणती लाल भाजी दृष्टीसाठी उत्तम आहे?',
        'options': ['टोमॅटो', 'गाजर', 'पालक', 'काकडी'],
        'answer': 'टोमॅटो',
        'explanation':
            'टोमॅटोमध्ये लायकोपीन मुबलक असते, जे चांगली दृष्टी आणि डोळ्यांचे आरोग्य राखण्यास मदत करते.'
      },
      {
        'question': 'जास्त फायबर असलेले सामान्य लाल रंगाचे अन्न कोणते आहे?',
        'options': ['लाल शिमला मिरची', 'चेरी', 'बीट', 'स्ट्रॉबेरी'],
        'answer': 'बीट',
        'explanation':
            'बीट फायबरने समृद्ध आहे आणि पचन आणि हृदयाच्या आरोग्यास मदत करते.'
      },
    ],
    Colors.orange: [
      {
        'question': 'नारंगी भाज्या कोणत्या पोषक तत्त्वाने समृद्ध आहेत?',
        'options': ['व्हिटॅमिन A', 'कॅल्शियम', 'प्रथिने', 'झिंक'],
        'answer': 'व्हिटॅमिन A',
        'explanation':
            'गाजरासारख्या नारंगी भाज्या व्हिटॅमिन A ने जास्त असतात, जे चांगल्या दृष्टीसाठी आवश्यक आहे.'
      },
      {
        'question': 'संत्र्यांमधील व्हिटॅमिन C कशास मदत करते?',
        'options': [
          'हाडांचे आरोग्य',
          'रोगप्रतिकारक समर्थन',
          'त्वचेची पुनर्जनन',
          'हृदयाचे आरोग्य'
        ],
        'answer': 'रोगप्रतिकारक समर्थन',
        'explanation':
            'संत्र्यांमधील व्हिटॅमिन C रोगप्रतिकारक शक्ती वाढवण्यास मदत करते.'
      },
      {
        'question': 'कोणते नारंगी फळ त्वचेच्या सुरकुत्या कमी करण्यास मदत करते?',
        'options': ['संत्रा', 'आंबा', 'पपई', 'पिच'],
        'answer': 'संत्रा',
        'explanation':
            'संत्रे व्हिटॅमिन C ने समृद्ध आहेत, जे त्वचेची रचना सुधारते आणि सुरकुत्या कमी करते.'
      },
      {
        'question': 'कोणती नारंगी भाजी बीटा-कॅरोटीनने जास्त आहे?',
        'options': ['कद्दू', 'गाजर', 'रताळे', 'बटरनट स्क्वॅश'],
        'answer': 'गाजर',
        'explanation':
            'गाजर बीटा-कॅरोटीनने समृद्ध आहे, जे शरीर व्हिटॅमिन A मध्ये रूपांतरित करते, जे चांगल्या दृष्टीसाठी आहे.'
      },
      {
        'question': 'दररोज संत्रे खाण्याचा सर्वोत्तम फायदा काय आहे?',
        'options': [
          'पचन सुधारते',
          'रोगप्रतिकारक शक्ती वाढवते',
          'कर्करोगाचा धोका कमी करते',
          'स्मरणशक्ती वाढवते'
        ],
        'answer': 'रोगप्रतिकारक शक्ती वाढवते',
        'explanation':
            'संत्रे व्हिटॅमिन C ने भरलेले आहेत जे शरीराची रोगप्रतिकारक शक्ती वाढवण्यास मदत करते.'
      },
    ],
    Colors.yellow: [
      {
        'question': 'पिवळ्या फळांमध्ये कोणते व्हिटॅमिन सामान्यतः आढळते?',
        'options': ['व्हिटॅमिन B', 'व्हिटॅमिन C', 'व्हिटॅमिन D', 'व्हिटॅमिन E'],
        'answer': 'व्हिटॅमिन C',
        'explanation':
            'केळ्यासारखी पिवळी फळे व्हिटॅमिन C ने समृद्ध आहेत, जे शरीराला लोह शोषण्यास मदत करते.'
      },
      {
        'question': 'कोणते पिवळे फळ पोटॅशियमचा उत्तम स्रोत आहे?',
        'options': ['केळं', 'आंबा', 'अननस', 'पपई'],
        'answer': 'केळं',
        'explanation':
            'केळे पोटॅशियमने समृद्ध आहेत, जे स्नायूंच्या योग्य कार्यासाठी मदत करते.'
      },
      {
        'question': 'फळे आणि भाज्यांमधील पिवळा रंग काय दर्शवतो?',
        'options': [
          'अँटिऑक्सिडंट्समध्ये जास्त',
          'कॅल्शियमने जास्त',
          'व्हिटॅमिन C ने समृद्ध',
          'पोटॅशियमने समृद्ध'
        ],
        'answer': 'अँटिऑक्सिडंट्समध्ये जास्त',
        'explanation':
            'पिवळी फळे आणि भाज्या बहुतेकदा अँटिऑक्सिडंट्समध्ये जास्त असतात, जे पेशींना नुकसानापासून संरक्षण करतात.'
      },
      {
        'question': 'कोणती पिवळी भाजी व्हिटॅमिन A ने समृद्ध आहे?',
        'options': ['मका', 'पिवळी शिमला मिरची', 'स्क्वॅश', 'कोबी'],
        'answer': 'पिवळी शिमला मिरची',
        'explanation':
            'पिवळी शिमला मिरची व्हिटॅमिन A ने समृद्ध आहे, जी डोळ्यांच्या आरोग्यासाठी आणि रोगप्रतिकारक कार्यासाठी आवश्यक आहे.'
      },
      {
        'question': 'पिवळ्या मिरच्यांचा खाण्याचा सर्वोत्तम फायदा काय आहे?',
        'options': [
          'फायबरने समृद्ध',
          'व्हिटॅमिन C ने समृद्ध',
          'त्वचेच्या आरोग्यासाठी चांगले',
          'प्रथिनांनी समृद्ध'
        ],
        'answer': 'व्हिटॅमिन C ने समृद्ध',
        'explanation':
            'पिवळ्या मिरच्या व्हिटॅमिन C ने जास्त असतात, जे रोगप्रतिकारक शक्ती वाढवते आणि निरोगी त्वचा वाढवते.'
      },
    ],
    Colors.green: [
      {
        'question': 'कोणती हिरवी भाजी लोहाने समृद्ध आहे?',
        'options': ['पालक', 'लेट्यूस', 'ब्रॉकोली', 'काकडी'],
        'answer': 'पालक',
        'explanation':
            'पालक लोहाने समृद्ध आहे, जे लाल रक्तपेशींच्या निर्मितीसाठी आवश्यक आहे.'
      },
      {
        'question': 'कोणते हिरवे फळ व्हिटॅमिन K ने जास्त आहे?',
        'options': ['अ‍ॅव्होकॅडो', 'किवी', 'हिरवे सफरचंद', 'काकडी'],
        'answer': 'अ‍ॅव्होकॅडो',
        'explanation':
            'अ‍ॅव्होकॅडो व्हिटॅमिन K ने जास्त असते, जे हाडांच्या आरोग्यास आणि रक्त गोठण्यास समर्थन करते.'
      },
      {
        'question': 'हिरव्या भाज्या खाणे कशास मदत करते?',
        'options': [
          'त्वचेचे आरोग्य',
          'हाडांचे आरोग्य',
          'हृदयाचे आरोग्य',
          'मेंदूची कार्यक्षमता'
        ],
        'answer': 'हृदयाचे आरोग्य',
        'explanation':
            'पालक आणि केलसारख्या हिरव्या भाज्या त्यांच्या जास्त फायबरमुळे हृदयाच्या आरोग्यासाठी चांगल्या असतात.'
      },
      {
        'question': 'कोणती भाजी पचन सुधारण्यासाठी उत्तम आहे?',
        'options': ['काकडी', 'ब्रॉकोली', 'केल', 'पालक'],
        'answer': 'काकडी',
        'explanation':
            'काकडी त्यांच्या जास्त पाणी आणि फायबरमुळे पचनासाठी उत्तम आहे.'
      },
      {
        'question':
            'हिरव्या भाज्यांमधील कोणते पोषक तत्त्व डोळ्यांचे आरोग्य राखण्यास मदत करते?',
        'options': ['व्हिटॅमिन A', 'व्हिटॅमिन B', 'व्हिटॅमिन C', 'व्हिटॅमिन D'],
        'answer': 'व्हिटॅमिन A',
        'explanation':
            'केल आणि पालकासारख्या हिरव्या भाज्या व्हिटॅमिन A ने समृद्ध आहेत, जे चांगली दृष्टी राखण्यासाठी महत्त्वाचे आहे.'
      },
    ],
    Colors.blue: [
      {
        'question': 'कोणते निळे अन्न हृदयाच्या आरोग्यासाठी चांगले आहे?',
        'options': ['ब्लूबेरी', 'वांगी', 'प्लम', 'निळे बटाटे'],
        'answer': 'ब्लूबेरी',
        'explanation':
            'ब्लूबेरी अँटिऑक्सिडंट्सने समृद्ध आहेत आणि हृदयाच्या आरोग्यासाठी चांगले आहेत.'
      },
      {
        'question': 'ब्लूबेरीमध्ये कोणते पोषक तत्त्व मुबलक आहे?',
        'options': [
          'व्हिटॅमिन C',
          'व्हिटॅमिन A',
          'अँटिऑक्सिडंट्स',
          'व्हिटॅमिन E'
        ],
        'answer': 'अँटिऑक्सिडंट्स',
        'explanation':
            'ब्लूबेरी अँटिऑक्सिडंट्सने भरलेले आहेत, जे सूज कमी करतात आणि एकंदरीत आरोग्य सुधारतात.'
      },
      {
        'question': 'निळ्या अन्नाचा खाण्याचा मुख्य फायदा काय आहे?',
        'options': [
          'दृष्टीसाठी चांगले',
          'लोहाने समृद्ध',
          'रोगप्रतिकारक आरोग्यास समर्थन',
          'सूज कमी करते'
        ],
        'answer': 'सूज कमी करते',
        'explanation':
            'ब्लूबेरीसारखे निळे अन्न अँटिऑक्सिडंट्स असतात जे शरीरातील सूज कमी करण्यास मदत करतात.'
      },
      {
        'question': 'कोणते निळे फळ स्मरणशक्ती सुधारण्यासाठी चांगले आहे?',
        'options': ['ब्लूबेरी', 'द्राक्षे', 'प्लम', 'पिअर'],
        'answer': 'ब्लूबेरी',
        'explanation':
            'ब्लूबेरी स्मरणशक्ती आणि संज्ञानात्मक कार्य सुधारण्यासाठी ओळखले जाते.'
      },
      {
        'question': 'कोणती निळी भाजी व्हिटॅमिन C ने समृद्ध आहे?',
        'options': ['निळी कोबी', 'जांभळी फूलकोबी', 'निळे बटाटे', 'वांगी'],
        'answer': 'जांभळी फूलकोबी',
        'explanation':
            'जांभळी फूलकोबी व्हिटॅमिन C ने समृद्ध आहे, जे रोगप्रतिकारक शक्तीला समर्थन देते.'
      },
    ],
  };

  late List<Map<String, dynamic>> _selectedColorQuestions;

  @override
  void initState() {
    super.initState();
    _selectedColorQuestions = _quizData[widget.color]!;
  }

  void _checkAnswer(String selectedOption) {
    final question = _selectedColorQuestions[_currentQuestionIndex];
    final correctAnswer = question['answer'];
    final explanation = question['explanation'];

    setState(() {
      if (selectedOption == correctAnswer) {
        _score++;
        _feedback = 'बरोबर!';
      } else {
        _feedback = 'चूक!';
        _correctAnswer = correctAnswer;
      }
      _feedbackExplanation = explanation;
      _showFeedback = true;
    });

    // Wait before loading next question
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        if (_currentQuestionIndex < _selectedColorQuestions.length - 1) {
          _currentQuestionIndex++;
          _showFeedback = false;
        } else {
          // If all questions for this color are done, show the next category or complete the quiz
          if (widget.color == Colors.blue) {
            // Show final score
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('प्रश्नमंजुषा पूर्ण झाली'),
                  content: Text('तुमचा अंतिम स्कोअर $_score आहे'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('ठीक आहे'),
                    ),
                  ],
                );
              },
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RainbowDietQuizPage(color: _getNextColor(widget.color)),
              ),
            );
          }
        }
      });
    });
  }

  Color _getNextColor(Color currentColor) {
    if (currentColor == Colors.red) return Colors.orange;
    if (currentColor == Colors.orange) return Colors.yellow;
    if (currentColor == Colors.yellow) return Colors.green;
    if (currentColor == Colors.green) return Colors.blue;
    return Colors.red; // Default fallback
  }

  @override
  Widget build(BuildContext context) {
    final question = _selectedColorQuestions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('इंद्रधनुष्य आहार प्रश्नमंजुषा'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              question['question'],
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ...question['options']
                .map<Widget>((option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.color,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => _checkAnswer(option),
                        child: Text(
                          option,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ))
                .toList(),
            if (_showFeedback)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  '$_feedback $_correctAnswer',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            if (_showFeedback && _feedbackExplanation.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  _feedbackExplanation,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
