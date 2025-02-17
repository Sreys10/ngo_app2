import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class EnvironmentGame extends StatefulWidget {
  const EnvironmentGame({super.key});

  @override
  _EnvironmentGameState createState() => _EnvironmentGameState();
}

class _EnvironmentGameState extends State<EnvironmentGame> {
  int _currentStep = 0;
  int _score = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Map<String, dynamic>> _steps = [
    {
      "scene": "चालू नळामुळे पाणी वाया जात आहे.",
      "options": ["नळ बंद करा", "चालू ठेवा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/gif/faucelet.gif",
      "feedback":
          "नळ बंद करण्याने पाण्याची बचत होते आणि या मौल्यवान संसाधनाचे संरक्षण होते!",
    },
    {
      "scene": "जमिनीवर कचऱ्याचा ढीग आहे.",
      "options": ["कचरा उचला", "निघून जा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/waste.jpeg",
      "feedback":
          "कचरा उचलण्याने पर्यावरण स्वच्छ राहते आणि वन्यजीवांचे संरक्षण होते!",
    },
    {
      "scene": "एक झाड तोडले जात आहे.",
      "options": ["तोडणे थांबवा", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/gif/tree.gif",
      "feedback":
          "झाडे वाचवल्याने कार्बन डायऑक्साईड कमी होतो आणि आपल्याला श्वास घेण्यासाठी ऑक्सिजन मिळतो!",
    },
    {
      "scene": "नदीत प्लास्टिकची बाटली तरंगत आहे.",
      "options": ["बाटली काढा", "तिथेच सोडा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/plastic_bottle.jpg",
      "feedback":
          "नदीतून प्लास्टिक काढल्याने जलचर जीवांचे संरक्षण होते आणि पाणी स्वच्छ राहते!",
    },
    {
      "scene": "एक पक्षी प्लास्टिकमध्ये अडकला आहे.",
      "options": ["पक्ष्याला मदत करा", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/gif/bird.gif",
      "feedback":
          "संकटात असलेल्या प्राण्यांना मदत करणे जैवविविधतेचे संरक्षण करते आणि करुणा दर्शवते!",
    },
    {
      "scene": "दूरवर जंगलात आग लागली आहे.",
      "options": ["त्वरित कळवा", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/gif/forest_fire.gif",
      "feedback":
          "जंगलातील आगीची माहिती देण्याने वन्यजीवांना वाचवता येते आणि पुढील नुकसान टाळता येते!",
    },
    {
      "scene": "कोणीतरी वीज वाया घालवत आहे.",
      "options": ["ऊर्जा वाचवण्याचा सल्ला द्या", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONEMENT/waste_electricity.jpeg",
      "feedback":
          "वीज वाचवल्याने कार्बन उत्सर्जन कमी होते आणि हवामान बदलाशी लढण्यास मदत होते!",
    },
    {
      "scene": "एक कारखाना हवा प्रदूषित करत आहे.",
      "options": ["अधिकाऱ्यांना कळवा", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/gif/factory.gif",
      "feedback":
          "प्रदूषणाची तक्रार केल्याने आपण श्वास घेत असलेल्या हवेचे आणि पर्यावरणाचे संरक्षण होते!",
    },
    {
      "scene": "एक मधमाशी उडण्यासाठी धडपडत आहे.",
      "options": ["मधमाशीला मदत करा", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/gif/bee.gif",
      "feedback":
          "मधमाश्या परागीकरण आणि परिसंस्थेच्या संतुलनासाठी आवश्यक आहेत!",
    },
    {
      "scene": "झाडावर प्लास्टिकची पिशवी अडकली आहे.",
      "options": ["पिशवी काढा", "तिथेच सोडा"],
      "correctAnswer": 0,
      "image": "assets/ENVIRONMENT/plastic_bag.jpg",
      "feedback":
          "झाडांवरून प्लास्टिक काढल्याने वन्यजीवांचे संरक्षण होते आणि पर्यावरण स्वच्छ राहते!",
    },
  ];

  void _shuffleOptions() {
    for (var step in _steps) {
      List<String> options = List.from(step["options"]);
      int correctAnswer = step["correctAnswer"];
      options.shuffle();
      step["correctAnswer"] = options.indexOf(step["options"][correctAnswer]);
      step["options"] = options;
    }
  }

  @override
  void initState() {
    super.initState();
    _shuffleOptions();
  }

  void _handleOptionSelected(int selectedOption) async {
    bool isCorrect = selectedOption == _steps[_currentStep]["correctAnswer"];

    if (isCorrect) {
      await _audioPlayer.play(AssetSource('sounds/correct.mp3'));
    } else {
      await _audioPlayer.play(AssetSource('sounds/wrong.mp3'));
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? "बरोबर!" : "अरेरे!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_steps[_currentStep]["feedback"]),
            const SizedBox(height: 10),
            Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: isCorrect ? Colors.green : Colors.red,
              size: 50,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (_currentStep < _steps.length - 1) {
                setState(() {
                  _currentStep++;
                });
              } else {
                _showGameOverDialog();
              }
            },
            child: const Text("पुढे"),
          ),
        ],
      ),
    );

    if (isCorrect) {
      setState(() {
        _score += 10;
      });
    }
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("खेळ संपला"),
        content: Text("तुमचे अंतिम गुण: $_score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentStep = 0;
                _score = 0;
                _shuffleOptions();
              });
            },
            child: const Text("पुन्हा खेळा"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरण खेळ'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Column(
                children: [
                  Image.asset(
                    _steps[_currentStep]["image"],
                    height: 250, // Increased size
                    width: 250, // Increased size
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _steps[_currentStep]["scene"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: _steps[_currentStep]["options"].map<Widget>((option) {
                  int index = _steps[_currentStep]["options"].indexOf(option);
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      onPressed: () => _handleOptionSelected(index),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "गुण: $_score",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (_currentStep + 1) / _steps.length,
                    backgroundColor: Colors.grey[300],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
