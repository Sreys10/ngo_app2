import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ProTest extends StatefulWidget {
  const ProTest({super.key});

  @override
  _ProTestState createState() => _ProTestState();
}

class _ProTestState extends State<ProTest> with SingleTickerProviderStateMixin {
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
    {
      'question': 'व्यायामाचे आरोग्यासाठी महत्त्व काय आहे?',
      'answers': [
        {
          'text': 'शरीर तंदुरुस्त ठेवण्यासाठी',
          'isCorrect': true,
          'explanation':
              'नियमित व्यायाम शरीर तंदुरुस्त ठेवतो आणि अनेक रोग टाळतो.',
        },
        {
          'text': 'फक्त वजन कमी करण्यासाठी',
          'isCorrect': false,
          'explanation': 'व्यायामाचे फायदे वजन कमी करण्यापेक्षा जास्त आहेत.',
        },
        {
          'text': 'फक्त पचनासाठी',
          'isCorrect': false,
          'explanation': 'व्यायाम पचन सुधारतो, पण त्याचे फायदे व्यापक आहेत.',
        },
      ],
    },
    {
      'question': 'हात स्वच्छ धुणे का गरजेचे आहे?',
      'answers': [
        {
          'text': 'जंतू दूर करण्यासाठी',
          'isCorrect': true,
          'explanation':
              'हात स्वच्छ धुतल्याने जंतू दूर होतात आणि आजारांचा धोका कमी होतो.',
        },
        {
          'text': 'फक्त सौंदर्यासाठी',
          'isCorrect': false,
          'explanation': 'हात धुण्याचा उद्देश सौंदर्य नसून आरोग्य आहे.',
        },
        {
          'text': 'फक्त चांगले दिसण्यासाठी',
          'isCorrect': false,
          'explanation': 'हात स्वच्छ धुण्याचा उद्देश आजार टाळणे हा आहे.',
        },
      ],
    },
    {
      'question': 'पुरेशी झोप का महत्त्वाची आहे?',
      'answers': [
        {
          'text': 'शरीर आणि मन ताजेतवाने ठेवण्यासाठी',
          'isCorrect': true,
          'explanation': 'पुरेशी झोप शरीर आणि मन ताजेतवाने ठेवते.',
        },
        {
          'text': 'फक्त वजन कमी करण्यासाठी',
          'isCorrect': false,
          'explanation':
              'झोप वजन कमी करण्यासाठी नाही, तर शरीराच्या पुनर्बांधणीसाठी आहे.',
        },
        {
          'text': 'फक्त कामासाठी ऊर्जा मिळण्यासाठी',
          'isCorrect': false,
          'explanation': 'झोपेचे फायदे कामासाठी ऊर्जा मिळण्यापेक्षा अधिक आहेत.',
        },
      ],
    },
    {
      'question': 'दात स्वच्छ ठेवण्यासाठी काय करायला हवे?',
      'answers': [
        {
          'text': 'दात नियमित ब्रश करणे',
          'isCorrect': true,
          'explanation':
              'दात नियमित ब्रश केल्याने दात मजबूत आणि स्वच्छ राहतात.',
        },
        {
          'text': 'फक्त पाणी प्यावे',
          'isCorrect': false,
          'explanation': 'पाणी पिणे महत्त्वाचे असले तरी ब्रश करणे आवश्यक आहे.',
        },
        {
          'text': 'फक्त चॉकलेट टाळावे',
          'isCorrect': false,
          'explanation': 'चॉकलेट टाळण्यासोबतच ब्रश करणेही आवश्यक आहे.',
        },
      ],
    },
    {
      'question': 'फळे आणि भाज्या खाण्याचे फायदे काय आहेत?',
      'answers': [
        {
          'text': 'शरीराला आवश्यक पोषण मिळते',
          'isCorrect': true,
          'explanation':
              'फळे आणि भाज्या खाल्ल्याने शरीराला आवश्यक जीवनसत्त्वे आणि खनिजे मिळतात.',
        },
        {
          'text': 'फक्त वजन वाढते',
          'isCorrect': false,
          'explanation':
              'फळे आणि भाज्या वजन वाढवण्यासाठी नाहीत, तर पोषणासाठी असतात.',
        },
        {
          'text': 'फक्त उष्णता मिळते',
          'isCorrect': false,
          'explanation': 'फळे आणि भाज्या उष्णता कमी आणि पोषण जास्त देतात.',
        },
      ],
    },
  ];
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _explanation;
  bool? _isAnswerCorrect;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));

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
      if (isCorrect) {
        _score++;
        _confettiController.play();
      }
      _animationController.forward(from: 0);
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _explanation = null;
      _isAnswerCorrect = null;
      _confettiController.stop();
      _animationController.reset();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('प्री-टेस्ट'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.yellowAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: [
              Colors.green,
              Colors.blue,
              Colors.orange,
              Colors.pink,
              Colors.redAccent
            ],
          ),
          Center(
            child: _currentQuestionIndex < _questions.length
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _questions[_currentQuestionIndex]['question']
                              as String,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
                            child: Text(
                              _explanation!,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
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
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentQuestionIndex = 0;
                            _score = 0;
                            _explanation = null;
                            _isAnswerCorrect = null;
                            _confettiController.stop();
                            _animationController.reset();
                          });
                        },
                        child: Text('पुन्हा सुरू करा'),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
