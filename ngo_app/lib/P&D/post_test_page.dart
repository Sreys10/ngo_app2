import 'package:flutter/material.dart';

class PostTestPage extends StatefulWidget {
  const PostTestPage({super.key});

  @override
  _PostTestPageState createState() => _PostTestPageState();
}

class _PostTestPageState extends State<PostTestPage> {
  List<int?> selectedAnswers = List.filled(15, null);

  final List<String> questions = [
    "करिअर निवडताना कोणते घटक विचारात घेतले पाहिजेत?",
    "तुमच्या स्वभावानुसार कोणता करिअर तुमच्यासाठी योग्य आहे?",
    "तुमच्या आवडीच्या क्षेत्रातील संधी शोधण्यासाठी कोणते साधन उपयुक्त आहे?",
    "करिअर निवडताना शॉर्ट टर्म आणि लाँग टर्म लक्ष्य का महत्त्वाचे आहे?",
    "एखाद्या करिअरमध्ये यशस्वी होण्यासाठी कोणत्या कौशल्यांचा विकास करणे आवश्यक आहे?",
    "मूलभूत हक्कांमध्ये अभिव्यक्ती स्वातंत्र्याचा समावेश का केला आहे?",
    "नागरिकाच्या जबाबदाऱ्या कोणत्या असतात?",
    "गोपनीयतेचा हक्क कोणत्या परिस्थितीत महत्त्वाचा ठरतो?",
    "विविधतेचा आदर करणे समाजासाठी का आवश्यक आहे?",
    "माहितीच्या हक्काचा योग्य उपयोग कसा करता येईल?",
    "समाजात समजुतीने वागण्याचे फायदे कोणते आहेत?",
    "एका लोकशाही देशात व्यक्तीचे मत महत्त्वाचे का असते?",
    "सामाजिक न्याय म्हणजे काय?",
    "सामाजिक माध्यमांचा जबाबदारीने वापर का आवश्यक आहे?",
    "पर्यावरण संवर्धनासाठी आपली भूमिका कोणती असावी?"
  ];

  final List<List<String>> options = [
    ["स्वतःची आवड", "फक्त पगार", "इतरांच्या मतावर अवलंबून राहणे", "कोणताही विचार न करणे"],
    ["तुमच्या आवडी आणि कौशल्यांवर आधारित", "फक्त मित्रांनी निवडलेले", "कोणत्याही विचाराशिवाय निवडलेले", "फक्त उच्च पगाराची नोकरी"],
    ["संशोधन आणि मार्गदर्शन तज्ज्ञ", "फक्त नशिब", "फक्त एकाच ठिकाणी अर्ज करणे", "करिअरची तुलना न करणे"],
    ["लक्ष्य निश्चित केल्याने योग्य दिशा मिळते", "लक्ष्य ठरवण्याची गरज नाही", "फक्त नोकरी मिळवणे महत्त्वाचे", "लक्ष्यामुळे संधी कमी होतात"],
    ["संचार कौशल्य", "फक्त शालेय गुण", "फक्त तांत्रिक कौशल्य", "यशासाठी कोणतीही कौशल्ये आवश्यक नाहीत"],
    ["लोकशाहीत स्वतंत्र मत व्यक्त करता येते", "इतरांवर जबरदस्तीने मत लादणे", "केवळ सरकारलाच बोलण्याचा अधिकार असतो", "मत मांडणे चुकीचे आहे"],
    ["देशाच्या कायद्यांचे पालन करणे", "फक्त स्वतःच्या फायद्याचा विचार करणे", "सामाजिक नियम तोडणे", "इतरांची मदत न करणे"],
    ["स्वतःची माहिती सुरक्षित ठेवणे", "सर्व माहिती उघड करणे", "गोपनीयतेचा विचार न करणे", "इतरांचे गुपित उघड करणे"],
    ["सर्व संस्कृतींचा आदर करणे", "फक्त आपल्या समूहाचा विचार करणे", "इतर संस्कृती नाकारणे", "फक्त समानतेवर भर"],
    ["योग्य माहिती मिळवून जबाबदारीने वापरणे", "फक्त सोशल मीडियावर माहिती पसरवणे", "खोटी माहिती स्वीकारणे", "माहितीचा गैरवापर करणे"],
    ["संवाद सुधारतो आणि सहकार्य वाढते", "फक्त स्वतःचा विचार करणे", "इतरांच्या मतांचा आदर न करणे", "समस्यांकडे दुर्लक्ष करणे"],
    ["प्रत्येक नागरिकाचे मत देशासाठी महत्त्वाचे आहे", "फक्त काही लोकांचे मत महत्त्वाचे", "मतदानाला महत्त्व नाही", "फक्त प्रसिद्ध लोकांचे मत महत्त्वाचे"],
    ["समाजातील सर्वांना समान संधी देणे", "फक्त श्रीमंत लोकांना प्राधान्य देणे", "कायद्याचे पालन न करणे", "फक्त स्वतःचा फायदा पाहणे"],
    ["माहिती जबाबदारीने शेअर करणे", "फक्त अफवा पसरवणे", "गैरवापर करणे", "इतरांचा अपमान करणे"],
    ["पर्यावरणाचे संरक्षण करणे", "केवळ सरकारने हे करावे", "फक्त मोठ्या कंपन्यांनी जबाबदारी घ्यावी", "पर्यावरणाचा विचार करणे गरजेचे नाही"]
  ];

  final List<int> correctAnswers = [
    0, 0, 0, 0, 0, // Career Understanding
    0, 0, 0, 0, 0, // Rights & Responsibilities
    0, 0, 0, 0, 0  // Social Awareness
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
            title: Text("उत्तर चाचणी पूर्ण झाली!"),
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
      appBar: AppBar(title: Text('उत्तर चाचणी (Post-Test)')),
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
