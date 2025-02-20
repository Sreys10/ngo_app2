import 'package:flutter/material.dart';

class GrowthMindsetGame extends StatefulWidget {
  const GrowthMindsetGame({super.key});

  @override
  _GrowthMindsetGameState createState() => _GrowthMindsetGameState();
}

class _GrowthMindsetGameState extends State<GrowthMindsetGame> {
  String _currentStage = "Introduction";
  int _currentScenarioIndex = 0;
  int _score = 0;
  final int _totalChallenges = 10; // Set the number of challenges
  final List<Map<String, String>> _scenarios = [
    {
      'situation': 'तुम्ही एका कठीण गणिताच्या समस्येशी झुंजत आहात. तुम्ही काय कराल?',
      'success': 'तुम्ही अधिक सराव केला, ट्युटोरियल पाहिले आणि समस्या सोडवली! \nटीप: सततता म्हणजेच यश.',
      'failure': 'तुम्ही शिकण्याची संधी गमावली. पुढच्या वेळी लक्षात ठेवा, सरावाने परिपूर्णता येते! \nटीप: आव्हाने शिकण्याची संधी असतात.',
    },
    {
      'situation': 'तुमच्या प्रोजेक्ट सादरीकरणाला नकारात्मक प्रतिसाद मिळाला. तुम्ही काय कराल?',
      'success': 'तुम्ही प्रतिसादाचे विश्लेषण केले, सुधारणा केली आणि पुढील सादरीकरणात यश मिळवले! \nटीप: रचनात्मक टीका आपल्याला वाढवण्यासाठी मदत करते.',
      'failure': 'टीका ही एक भेट आहे. त्याचा वापर सुधारण्यासाठी करा! \nटीप: टीकेला सुधारण्यासाठी एका साधन म्हणून स्वीकारा.',
    },
    {
      'situation': 'तुम्ही क्रीडा संघात निवडले गेले नाही. तुम्ही काय कराल?',
      'success': 'तुम्ही तुमच्या कौशल्यावर मेहनत केली आणि पुढील वर्षी निवडले गेलात! \nटीप: मेहनतीचा फळ वेळोवेळी मिळतो.',
      'failure': 'नाकारले जाणे म्हणजे यशाकडे जात असलेली पायरी आहे. प्रयत्न करत राहा! \nटीप: नाकारला जाणे तुम्हाला ठरवत नाही. पुढे चालू ठेवा.',
    },
    {
      'situation': 'तुम्ही नवीन कौशल्य शिकण्याचा प्रयत्न करत आहात, जसे की गिटार वादन, पण ते जितके अपेक्षित होते तितके लवकर होत नाही. तुम्ही काय कराल?',
      'success': 'तुम्ही दररोज सराव केला आणि अखेरीस तुमचं गिटार वादन उत्तम झालं! \nटीप: सातत्याने सराव केल्याने कौशल्य मिळवता येते.',
      'failure': 'तुम्ही लवकरच हार मानली, आणि तुमचं मोठं कौशल्य विकसित करण्याची संधी गमावली. \nटीप: प्रगतीसाठी प्रयत्न करणे महत्त्वाचे आहे.',
    },
    {
      'situation': 'तुम्ही स्पर्धेत भाग घेतला पण फायनलमध्ये निवडले गेले नाही. तुम्ही काय कराल?',
      'success': 'तुम्ही तुमच्या चुका विश्लेषण केल्या, आणि उत्तम योजना तयार केली आणि पुन्हा प्रयत्न करण्यास तयार आहात! \nटीप: अपयश सुधारण्याच्या पायरीसारखे असते.',
      'failure': 'तुम्ही ठरवलं की स्पर्धा तुमच्यासाठी नाहीत आणि भविष्यकाळात संधी गमावली. \nटीप: आव्हाने आपल्याला वाढवण्यासाठी मदत करतात.',
    },
    {
      'situation': 'तुम्ही विज्ञानाच्या चाचणीमध्ये अपयश गमावले. तुम्ही कसे प्रतिसाद द्याल?',
      'success': 'तुम्ही खूप अभ्यास केला आणि पुनः परीक्षा उत्तीर्ण केली! \nटीप: मेहनत आणि कठोर काम म्हणजेच यश.',
      'failure': 'तुम्ही ठरवलं की विज्ञान तुमच्यासाठी नाही. \nटीप: जड गोष्टींवर हार मानू नका.',
    },
    {
      'situation': 'तुम्ही पोस्ट केलेल्या व्हिडिओसाठी टीका मिळाली. तुम्ही त्याला कसे हाताळाल?',
      'success': 'तुम्ही टीकेला रचनात्मकपणे वापरले आणि पुढील व्हिडिओ सुधारला! \nटीप: टीका सुधारण्यासाठी महत्त्वपूर्ण असते.',
      'failure': 'तुम्ही व्हिडिओ हटवला आणि आणखी काही पोस्ट न करण्याचा निर्णय घेतला. \nटीप: टीकेचा सामना करा, त्याचा उपयोग वाढण्यासाठी करा.',
    },
    {
      'situation': 'तुम्हाला हवी असलेली मार्क्स मिळत नाहीत. तुम्ही काय कराल?',
      'success': 'तुम्ही मदत मागितली, जास्त अभ्यास केला, आणि तुमचे मार्क्स सुधारले! \nटीप: मदत मागणं शक्तीचं चिन्ह आहे.',
      'failure': 'तुम्ही अभ्यास सोडला आणि सुधारणा गमावली. \nटीप: शैक्षणिक प्रगतीसाठी मेहनत करा.',
    },
    {
      'situation': 'तुम्हाला पार्टीत आमंत्रण मिळालं नाही. तुम्ही कसे प्रतिसाद द्याल?',
      'success': 'तुम्ही तुमच्या इतर मित्रांसोबत वेळ घालवला आणि आनंद घेतला! \nटीप: नाकारले गेले तरी तुमच्या आनंदावर परिणाम होऊ देऊ नका.',
      'failure': 'तुम्ही नाराज झालात आणि इतरांपासून दूर गेलात. \nटीप: नाकारणे वैयक्तिक नसते, आणि इतर योजना असण्यास हरकत नाही.',
    },
    {
      'situation': 'तुम्ही नवीन भाषा शिकत आहात, पण ते कठीण आहे. तुम्ही काय कराल?',
      'success': 'तुम्ही सराव करत राहिला आणि दररोज सुधारले! \nटीप: सातत्याने प्रयत्न केल्याने भाषा शिकता येते.',
      'failure': 'तुम्ही शिकणे थांबवले आणि भाषा शिकण्याची संधी गमावली. \nटीप: भाषा शिकायला वेळ लागतो, हार मानू नका.',
    },
  ];

  // List to store whether each challenge was answered correctly
  final List<bool> _challengeResults = [];

  void _nextStage(bool isSuccess) {
    setState(() {
      if (isSuccess) {
        _score += 10; // Add points for success
      } else {
        _score -= 5; // Deduct points for failure
      }

      // Store the result of the current challenge
      _challengeResults.add(isSuccess);

      _currentScenarioIndex++;
      if (_currentScenarioIndex < _totalChallenges) {
        _currentStage = "FeedbackStage";
      } else {
        _currentStage = "GameOver";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('वाढीचा मानसिकता खेळ'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 247, 174, 78), // Changed AppBar color
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'स्कोअर: $_score',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentStage == "Introduction") _buildIntroduction(),
            if (_currentStage == "ChallengeLevel") _buildChallengeLevel(),
            if (_currentStage == "FeedbackStage") _buildFeedback(),
            if (_currentStage == "GameOver") _buildGameOver(),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroduction() {
    return Column(
      children: [
        Text(
          'वाढीचा मानसिकता गेममध्ये स्वागत आहे!\n10 आव्हानांचा सामना करा आणि शिकण्याचा आणि वाढण्याचा निर्णय घ्या.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal), // Changed color
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _currentStage = "ChallengeLevel";
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 218, 196)), // Changed button color
          child: Text('गेम सुरू करा', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildChallengeLevel() {
    final scenario = _scenarios[_currentScenarioIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'आव्हान ${_currentScenarioIndex + 1}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          scenario['situation']!,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal), // Changed text color
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () => _nextStage(true), // Success path
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: const Color.fromARGB(255, 192, 243, 247), // Changed success button color
          ),
          child: Text(
            'मी प्रयत्न करत राहीन आणि माझ्या चुका शिकून सुधारित करीन!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _nextStage(false), // Failure path
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: const Color.fromARGB(255, 192, 243, 247), // Changed failure button color
          ),
          child: Text(
            'मी हार मानतो कारण ते खूप कठीण आहे.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildFeedback() {
    final scenario = _scenarios[_currentScenarioIndex - 1];
    bool isSuccess = _challengeResults[_currentScenarioIndex - 1];

    return Column(
      children: [
        Text(
          scenario['situation']!,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal), // Changed text color
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        Icon(
          isSuccess ? Icons.thumb_up : Icons.thumb_down,
          size: 100,
          color: isSuccess ? Colors.green : Colors.red,
        ),
        SizedBox(height: 40),
        Text(
          isSuccess ? scenario['success']! : scenario['failure']!,
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _currentStage = "ChallengeLevel";
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 218, 196)), // Changed button color
          child: Text('पुढील आव्हान', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }

  Widget _buildGameOver() {
    return Column(
      children: [
        Text(
          'गेम समाप्त!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal), // Changed color
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'अंतिम स्कोअर: $_score',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        SizedBox(height: 20),
        Text(
          _score > 50
              ? 'सर्वोत्कृष्ट! तुम्ही वाढीच्या मानसिकतेचा प्रदर्शन केला आणि आव्हानांना तोंड दिलं.'
              : 'प्रशिक्षण चालू ठेवा! लक्षात ठेवा, आव्हाने वाढण्याची संधी आहेत.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _currentStage = "Introduction";
              _currentScenarioIndex = 0;
              _score = 0;
              _challengeResults.clear(); // Reset results
            });
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 218, 196)), // Changed button color
          child: Text('पुन्हा सुरू करा', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
