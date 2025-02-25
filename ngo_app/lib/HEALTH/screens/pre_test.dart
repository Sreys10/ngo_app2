import 'package:flutter/material.dart';

class PreTest extends StatefulWidget {
  const PreTest({super.key});

  @override
  _PreTestState createState() => _PreTestState();
}

class _PreTestState extends State<PreTest> with SingleTickerProviderStateMixin {
  // List of questions, answers, and explanations in Marathi
  final List<Map<String, Object>> _questions = [
    {
      'question': 'संप्रेरक म्हणजे काय?',
      'answers': [
        {
          'text': 'शरीरातील रसायने',
          'isCorrect': true,
          'explanation':
              'संप्रेरक म्हणजे शरीरातील ग्रंथीतून स्रवणारे रसायने, जी शरीराची क्रिया नियंत्रित करतात.',
        },
        {
          'text': 'शरीराचे अवयव',
          'isCorrect': false,
          'explanation': 'संप्रेरक हे रसायने आहेत, अवयव नाहीत.',
        },
        {
          'text': 'शरीरातील स्नायू',
          'isCorrect': false,
          'explanation': 'स्नायू म्हणजे मांसल ऊती असतात, संप्रेरक नाहीत.',
        },
      ],
    },
    {
      'question': 'किशोरवयीन मुलांमध्ये संप्रेरक बदल का होतो?',
      'answers': [
        {
          'text': 'वाढ आणि लैंगिक विकासासाठी',
          'isCorrect': true,
          'explanation':
              'किशोरावस्थेत संप्रेरक बदल वाढ आणि लैंगिक विकासास कारणीभूत ठरतात.',
        },
        {
          'text': 'लठ्ठपणासाठी',
          'isCorrect': false,
          'explanation':
              'संप्रेरक बदल लठ्ठपणासाठी नाही तर शरीराच्या विकासासाठी असतो.',
        },
        {
          'text': 'रोगासाठी',
          'isCorrect': false,
          'explanation':
              'रोगासाठी नाही, तर वाढीसाठी आणि विकासासाठी संप्रेरक बदल होतो.',
        },
      ],
    },
    {
      'question': '"रेनबो डाएट" म्हणजे काय?',
      'answers': [
        {
          'text': 'वेगवेगळ्या रंगांचे अन्न खाणे',
          'isCorrect': true,
          'explanation':
              'रेनबो डाएट म्हणजे फळे आणि भाज्यांचे विविध रंग खाणे, जे आरोग्यासाठी फायदेशीर आहे.',
        },
        {
          'text': 'फक्त हिरव्या भाज्या',
          'isCorrect': false,
          'explanation':
              'रेनबो डाएटमध्ये फक्त हिरव्या भाज्या नाही, तर वेगवेगळ्या रंगाचे अन्न असते.',
        },
        {
          'text': 'फक्त जंक फूड',
          'isCorrect': false,
          'explanation': 'जंक फूड रेनबो डाएटचा भाग नाही.',
        },
      ],
    },
    {
      'question': 'किशोरवयीन मुलींमध्ये मासिक पाळीचा प्रभाव कसा होतो?',
      'answers': [
        {
          'text': 'शारीरिक आणि भावनिक बदल होतात',
          'isCorrect': true,
          'explanation': 'मासिक पाळीमुळे शारीरिक व भावनिक बदल होतात.',
        },
        {
          'text': 'काहीच बदल होत नाहीत',
          'isCorrect': false,
          'explanation': 'मासिक पाळीमुळे शरीरावर अनेक बदल होतात.',
        },
        {
          'text': 'फक्त लठ्ठपणा होतो',
          'isCorrect': false,
          'explanation':
              'मासिक पाळीमुळे फक्त लठ्ठपणा नाही, तर इतर शारीरिक बदल होतात.',
        },
      ],
    },
    {
      'question': 'पचन क्रिया सुरळीत होण्यासाठी काय खावे?',
      'answers': [
        {
          'text': 'भरपूर फायबर असलेले अन्न',
          'isCorrect': true,
          'explanation': 'फायबरयुक्त अन्न पचन सुधारण्यास मदत करते.',
        },
        {
          'text': 'फक्त साखर',
          'isCorrect': false,
          'explanation': 'साखर पचन क्रियेला मदत करत नाही.',
        },
        {
          'text': 'फक्त पाणी',
          'isCorrect': false,
          'explanation': 'पाणी उपयुक्त आहे, पण फायबरयुक्त अन्न आवश्यक आहे.',
        },
      ],
    },
    // Add more questions similarly as required.
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _explanation;
  bool? _isAnswerCorrect;
  bool _showCheckmark = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
  }

  void _answerQuestion(bool isCorrect, String explanation) {
    setState(() {
      _explanation = explanation;
      _isAnswerCorrect = isCorrect;
      _showCheckmark = isCorrect;
      if (isCorrect) _score++;
      _animationController.forward(from: 0);
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _explanation = null;
      _isAnswerCorrect = null;
      _showCheckmark = false;
      _animationController.reset();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('प्री-टेस्ट'),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: _isAnswerCorrect == null
            ? Colors.white
            : _isAnswerCorrect == true
                ? Colors.green[100]
                : Colors.red[100],
        child: Center(
          child: _currentQuestionIndex < _questions.length
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _questions[_currentQuestionIndex]['question'] as String,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ...(_questions[_currentQuestionIndex]['answers']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: _explanation == null
                                ? () => _answerQuestion(
                                      answer['isCorrect'] as bool,
                                      answer['explanation'] as String,
                                    )
                                : null,
                            child: Text(
                              answer['text'] as String,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                      if (_explanation != null) ...[
                        SizedBox(height: 20),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: _showCheckmark
                              ? Icon(Icons.check_circle,
                                  color: Colors.green, size: 48)
                              : SizedBox.shrink(),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _explanation!,
                          style:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _nextQuestion,
                          child: Text('पुढचा प्रश्न'),
                        ),
                      ],
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'तुमचा स्कोअर: $_score/${_questions.length}',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _currentQuestionIndex = 0;
                          _score = 0;
                          _explanation = null;
                          _isAnswerCorrect = null;
                          _showCheckmark = false;
                          _animationController.reset();
                        });
                      },
                      child: Text('पुन्हा सुरू करा'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
