import 'package:flutter/material.dart';

class PreTestPage extends StatefulWidget {
  const PreTestPage({super.key});

  @override
  _PreTestPageState createState() => _PreTestPageState();
}

class _PreTestPageState extends State<PreTestPage> {
  List<int?> selectedAnswers =
      List.filled(15, null); // Now supports 15 questions

  final List<String> questions = [
    // My Identity (5 Questions)
    "तुमच्या करिअर निवडीसंदर्भात तुम्ही कसे विचार करता?",
    "तुम्हाला तुमच्या व्यक्तिगत शक्ती किती चांगल्या प्रकारे माहित आहेत?",
    "तुम्ही तुमच्या छंद किंवा आवडीच्या क्रियाकलापांमध्ये किती वेळा भाग घेता?",
    "तुम्हाला करिअर निवडीसंबंधी किती आत्मविश्वास आहे?",
    "तुमच्या करिअर निवडण्यातील सर्वात मोठे आव्हान कोणते आहे?",

    // Emotions (5 Questions)
    "तुम्ही एखाद्या कठीण परिस्थितीत तुमच्या भावना किती चांगल्या प्रकारे व्यवस्थापित करता?",
    "तुम्हाला नवीन गोष्टी शिकण्याची आणि समजून घेण्याची आवड आहे का?",
    "तुम्ही गोंधळ किंवा तणावाच्या परिस्थितीत कसे प्रतिसाद देता?",
    "तुम्ही इतरांच्या भावनांबद्दल किती जागरूक आहात?",
    "तुमच्या भविष्यातील योजनांसाठी तुम्ही ठोस पावले उचलली आहेत का?",

    // Rights and Responsibility (5 Questions)
    "शिक्षणाचा हक्क म्हणजे काय?",
    "खालीलपैकी विद्यार्थ्याची जबाबदारी कोणती आहे?",
    "समतेचा हक्क म्हणजे काय?",
    "पर्यावरणासंबंधी तुमची जबाबदारी कोणती आहे?",
    "सार्वजनिक मालमत्तेबाबत तुमची जबाबदारी कोणती आहे?",
  ];

  final List<List<String>> options = [
    [
      "मला माझे करिअर स्पष्टपणे ठरवले आहे",
      "माझ्याकडे काही पर्याय आहेत, पण मी ठाम नाही",
      "मला अजूनही कल्पना नाही",
      "मी याबद्दल विचार केलेला नाही"
    ],
    [
      "खूप चांगले, मी अनेक शक्ती सांगू शकतो/शकते",
      "काही प्रमाणात, मला काही शक्ती माहित आहेत",
      "फारसे नाही, मला त्यांची ओळख पटत नाही",
      "अजिबात नाही"
    ],
    ["दररोज", "आठवड्यातून काही वेळा", "क्वचितच", "कधीच नाही"],
    [
      "पूर्ण आत्मविश्वास आहे",
      "काही प्रमाणात आत्मविश्वास आहे",
      "अजिबात आत्मविश्वास नाही",
      "मी याबद्दल अजून विचार केलेला नाही"
    ],
    [
      "मला माझ्या शक्ती आणि कमकुवतता माहित नाहीत",
      "माझ्या आवडीनुसार कोणते करिअर योग्य आहे हे माहित नाही",
      "मला योग्य मार्गदर्शन आणि संसाधने उपलब्ध नाहीत",
      "चुकीचा निर्णय घेण्याची भीती वाटते"
    ],
    [
      "मी माझ्या भावना चांगल्या प्रकारे व्यवस्थापित करतो/करते",
      "कधी कधी मला त्रास होतो",
      "माझ्यासाठी कठीण आहे",
      "मी अजिबात व्यवस्थापित करू शकत नाही"
    ],
    [
      "होय, मला शिकायला आवडते",
      "कधीकधी, पण मी सहज कंटाळतो",
      "फक्त आवश्यक असल्यास शिकतो",
      "नाही, मला शिकण्यात फारसा रस नाही"
    ],
    [
      "मी शांत राहतो आणि उपाय शोधतो",
      "मी तणावग्रस्त होतो पण प्रयत्न करतो",
      "माझ्या भावना नियंत्रित करणे कठीण जाते",
      "मी घाबरून जातो"
    ],
    [
      "मी नेहमी लक्ष देतो",
      "मी काहीवेळा विचार करतो",
      "मी फारसे लक्ष देत नाही",
      "मला इतरांच्या भावनांची जाणीव नाही"
    ],
    [
      "होय, मी योजना आखल्या आहेत आणि त्यावर काम करत आहे",
      "माझ्याकडे काही कल्पना आहेत, पण अजून काहीच केले नाही",
      "मी अजून सुरुवात केलेली नाही",
      "माझ्याकडे कोणतीही योजना नाही"
    ],
    ["सक्तीचे शिक्षण", "विनामूल्य शिक्षण", "दोन्ही", "काहीही नाही"],
    [
      "हव्या त्या वेळी शाळा बुडवणे",
      "शिक्षक आणि सहविद्यार्थ्यांचा आदर करणे",
      "गृहपाठ टाळणे",
      "शालेय नियमांकडे दुर्लक्ष करणे"
    ],
    [
      "लिंग, जात, धर्म यांपासून स्वतंत्रपणे समान वागणूक मिळणे",
      "इतरांशी अन्यायकारक वर्तन करण्याचा अधिकार",
      "जबरदस्तीने इतरांना आपल्याशी सहमत करणे",
      "कायम शांत राहणे"
    ],
    [
      "पाणी आणि वीज वाया घालवणे",
      "प्रदूषणाकडे दुर्लक्ष करणे",
      "कुठेही कचरा टाकणे",
      "झाडे लावणे आणि कचरा कमी करणे"
    ],
    [
      "रागाच्या भरात तिची तोडफोड करणे",
      "तिच्या महत्त्वाकडे दुर्लक्ष करणे",
      "तिचा आदर करणे आणि तिला संरक्षित करणे",
      "गैरवापर झाला तरी दुर्लक्ष करणे"
    ],
  ];

  final List<int> correctAnswers = [
    0, 0, 0, 0, 3, // My Identity
    0, 0, 0, 0, 0, // Emotions
    2, 1, 0, 3, 2 // Rights and Responsibility
  ];

  void _submitAnswers() {
    if (selectedAnswers.contains(null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("कृपया सर्व प्रश्नांची उत्तरे निवडा")),
      );
    } else {
      int score = 0;
      for (int i = 0; i < selectedAnswers.length; i++) {
        if (selectedAnswers[i] == correctAnswers[i]) {
          score++;
        }
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("पूर्व चाचणी पूर्ण झाली!"),
            content: Text("तुमचा स्कोर: $score / 15"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ठीक आहे"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('पूर्व चाचणी (Pre-Test)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. ${questions[index]}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: List.generate(
                    options[index].length,
                    (optionIndex) => RadioListTile<int>(
                      title: Text(options[index][optionIndex]),
                      value: optionIndex,
                      groupValue: selectedAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[index] = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _submitAnswers,
        label: Text("सबमिट"),
        icon: Icon(Icons.check),
      ),
    );
  }
}
