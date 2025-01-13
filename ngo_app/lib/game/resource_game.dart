// lib/game/resource_game.dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ResourceGame extends StatefulWidget {
  const ResourceGame({super.key});

  @override
  _ResourceGameState createState() => _ResourceGameState();
}

class _ResourceGameState extends State<ResourceGame> {
  int _currentStep = 0;
  int _score = 0;
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Map<String, dynamic>> _steps = [
    {
      "scene": "एका रिकाम्या खोलीत दिवे चालू आहेत.",
      "options": ["दिवे बंद करा", "दिवे चालू ठेवा"],
      "correctAnswer": 0,
      "image": "assets/gif/lights.gif",
      "feedback": "दिवे बंद करण्याने ऊर्जा वाचते आणि वीज बिल कमी होते!",
    },
    {
      "scene": "नळातून पाणी गळत आहे.",
      "options": ["नळ दुरुस्त करा", "दुर्लक्ष करा"],
      "correctAnswer": 0,
      "image": "assets/gif/faucelet.gif",
      "feedback":
          "गळणारा नळ दुरुस्त केल्याने वर्षाला 3,000 गॅलन पाणी वाचू शकते!",
    },
    {
      "scene": "संगणक रात्रभर चालू ठेवला आहे.",
      "options": ["बंद करा", "चालू ठेवा"],
      "correctAnswer": 0,
      "image": "assets/gif/comp.gif",
      "feedback":
          "वापरात नसताना इलेक्ट्रॉनिक्स बंद करण्याने ऊर्जा वाचते आणि कार्बन उत्सर्जन कमी होते!",
    },
    {
      "scene": "जमिनीवर प्लास्टिकची बाटली दिसत आहे.",
      "options": ["उचला आणि रिसायकल करा", "तिथेच सोडा"],
      "correctAnswer": 0,
      "image": "assets/gif/bottle.gif",
      "feedback":
          "प्लास्टिक रिसायकलिंग प्रदूषण कमी करते आणि समुद्री जीवांचे संरक्षण करते!",
    },
    {
      "scene": "तुम्ही कागदाचा वापर संपवला आहे.",
      "options": ["रिसायकल करा", "कचऱ्यात टाका"],
      "correctAnswer": 0,
      "image": "assets/gif/paper.gif",
      "feedback": "कागद रिसायकलिंग झाडे वाचवते आणि कचरा कमी करते!",
    },
    {
      "scene": "तुमच्या अंगणात पानांचा ढीग दिसत आहे.",
      "options": ["खत बनवा", "जाळून टाका"],
      "correctAnswer": 0,
      "image": "assets/gif/leaves.gif",
      "feedback": "पानांपासून खत बनवल्याने माती सुपीक होते आणि कचरा कमी होतो!",
    },
    {
      "scene": "तुम्ही किराणा खरेदी करत आहात.",
      "options": [
        "पुनर्वापर करण्यायोग्य पिशव्या वापरा",
        "प्लास्टिक पिशव्या वापरा"
      ],
      "correctAnswer": 0,
      "image": "assets/gif/shopping.gif",
      "feedback":
          "पुनर्वापर करण्यायोग्य पिशव्या वापरल्याने प्लास्टिक कचरा कमी होतो आणि पर्यावरणाचे रक्षण होते!",
    },
    {
      "scene": "तुम्ही जुने कपडे टाकणार आहात.",
      "options": ["दान करा", "कचऱ्यात टाका"],
      "correctAnswer": 0,
      "image": "assets/clothes.webp",
      "feedback": "कपडे दान केल्याने कचरा कमी होतो आणि गरजूंना मदत होते!",
    },
    {
      "scene": "तुम्ही रेस्टॉरंटमध्ये स्ट्रॉ वापरत आहात.",
      "options": [
        "पुनर्वापर करण्यायोग्य स्ट्रॉ वापरा",
        "प्लास्टिक स्ट्रॉ वापरा"
      ],
      "correctAnswer": 0,
      "image": "assets/gif/straw.gif",
      "feedback":
          "पुनर्वापर करण्यायोग्य स्ट्रॉ वापरल्याने प्लास्टिक प्रदूषण कमी होते आणि समुद्री जीवांचे संरक्षण होते!",
    },
    {
      "scene": "तुम्ही एक दस्तऐवज प्रिंट करणार आहात.",
      "options": ["दोन्ही बाजूंनी प्रिंट करा", "एका बाजूने प्रिंट करा"],
      "correctAnswer": 0,
      "image": "assets/gif/print.gif",
      "feedback":
          "दोन्ही बाजूंनी प्रिंट केल्याने कागद वाचतो आणि कचरा कमी होतो!",
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
        title: const Text('संसाधन खेळ'),
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
                    height: 200, // Increased GIF size
                    width: 200, // Increased GIF size
                  ),
                  const SizedBox(height: 10),
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
