import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PostTestScreen(),
    );
  }
}

class PostTestScreen extends StatefulWidget {
  const PostTestScreen({super.key});

  @override
  _PostTestPageState createState() => _PostTestPageState();
}

class _PostTestPageState extends State<PostTestScreen> {
  List<String?> userAnswers = List.filled(10, null);
  bool showAnswers = false;
  final ScrollController _scrollController = ScrollController();

  final List<String> correctAnswers = [
    'c',
    'c',
    'c',
    'c',
    'c',
    'c',
    'd',
    'b',
    'b',
    'c'
  ];

  final List<String> explanations = [
    'जत्रेत यशस्वी विक्रेता होण्यासाठी मागणी, पुरवठा आणि योग्य किंमत यांचा समतोल आवश्यक आहे, कारण हे बाजारातील यशाचे आधार आहेत.',
    'ग्राहकांना आकर्षित करण्यासाठी चांगल्या वस्तू, योग्य किंमत आणि आकर्षक मांडणी महत्त्वाची आहे, कारण यामुळे ग्राहकांचे लक्ष वेधले जाते.',
    'कौटुंबिक अंदाजपत्रकामुळे आर्थिक नियोजन आणि बचत शक्य होते, ज्यामुळे पैशांचा योग्य वापर होतो.',
    'अंदाजपत्रक बनवताना उत्पन्न, खर्च आणि भविष्यातील गरजा लक्षात घ्याव्या लागतात, कारण हे सर्वसमावेशक नियोजनासाठी आवश्यक आहे.',
    'गुंतवणुकीमुळे भविष्यात आर्थिक सुरक्षितता मिळते, कारण ती दीर्घकालीन फायदा देते.',
    'बचत करण्याचे मार्ग बँकेत ठेवणे, खर्च कमी करणे आणि गुंतवणूक करणे हे आहेत, कारण यामुळे आर्थिक स्थिरता वाढते.',
    'कर्जाचे तोटे म्हणजे परतफेड करावी लागते आणि जबाबदारी वाढते, दोन्ही गोष्टी विचारात घ्याव्या लागतात.',
    'कर्जाचे व्यवस्थापन वेळेवर परतफेड करून केले जाते, ज्यामुळे व्याजाचा बोजा कमी होतो.',
    'नोकरीत दुसऱ्यासाठी काम करावे लागते, तर उद्योजकतेत स्वतःचा व्यवसाय सुरू करावा लागतो, हा त्यांच्यातील मुख्य फरक आहे.',
    'यशस्वी उद्योजक होण्यासाठी कष्ट, आत्मविश्वास आणि नवीन कल्पना आवश्यक आहेत, कारण हे गुण व्यवसायात यश मिळवून देतात.',
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
                    curve: Curves.easeInOut);
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
                  overflow: TextOverflow.ellipsis,
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
              overflow: TextOverflow.ellipsis,
            ),
          ],
          const SizedBox(height: 8),
          Text(
            'स्पष्टीकरण: ${explanations[index]}',
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
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
                controller: _scrollController,
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
    'जत्रेत यशस्वी विक्रेता होण्यासाठी काय आवश्यक आहे?',
    'जत्रेत ग्राहकांना आकर्षित करण्यासाठी काय करता येईल?',
    'कौटुंबिक अंदाजपत्रक बनवण्याचे फायदे काय आहेत?',
    'अंदाजपत्रक बनवताना कोणत्या गोष्टी लक्षात घ्याव्यात?',
    'गुंतवणुकीचे फायदे काय आहेत?',
    'बचत करण्याचे वेगवेगळे मार्ग कोणते आहेत?',
    'कर्ज घेण्याचे तोटे काय आहेत?',
    'कर्जाचे व्यवस्थापन कसे करावे?',
    'नोकरी आणि उद्यमशीलता यात काय फरक आहे?',
    'यशस्वी उद्योजक होण्यासाठी काय गुण आवश्यक आहेत?',
  ];

  final List<List<String>> options = [
    [
      'a) फक्त कमी किंमत',
      'b) फक्त जास्त नफा',
      'c) मागणी, पुरवठा आणि योग्य किंमत',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) फक्त जाहिरात',
      'b) फक्त सवलत',
      'c) चांगल्या वस्तू, योग्य किंमत आणि आकर्षक मांडणी',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) खर्च वाढतो',
      'b) कर्ज वाढते',
      'c) आर्थिक नियोजन आणि बचत करता येते',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) फक्त उत्पन्न',
      'b) फक्त खर्च',
      'c) उत्पन्न, खर्च आणि भविष्यातील गरजा',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) पैसे कमी होतात',
      'b) जोखीम नसते',
      'c) भविष्यात आर्थिक सुरक्षितता मिळते',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) फक्त बँकेत पैसे ठेवणे',
      'b) फक्त खर्च कमी करणे',
      'c) बँकेत ठेवणे, खर्च कमी करणे आणि गुंतवणूक करणे',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) फायदा होतो',
      'b) परतफेड करावी लागते',
      'c) जबाबदारी वाढते',
      'd) (b) आणि (c) दोन्ही',
    ],
    [
      'a) जास्त कर्ज घ्यावे',
      'b) वेळेवर परतफेड करावी',
      'c) कर्जाबद्दल विचार करू नये',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) दोन्ही एकच आहेत',
      'b) नोकरीत दुसऱ्यासाठी काम करावे लागते, तर उद्योजकतेत स्वतःचा व्यवसाय सुरू करावा लागतो',
      'c) नोकरीत जास्त पैसे मिळतात',
      'd) यापैकी काहीही नाही',
    ],
    [
      'a) फक्त पैसे',
      'b) फक्त शिक्षण',
      'c) कष्ट, आत्मविश्वास आणि नवीन कल्पना',
      'd) यापैकी काहीही नाही',
    ],
  ];
}
