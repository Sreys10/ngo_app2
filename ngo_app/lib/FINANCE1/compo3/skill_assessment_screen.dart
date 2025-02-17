import 'package:flutter/material.dart';
import 'dart:math';
import 'result_screen.dart';

class SkillAssessmentScreen extends StatefulWidget {
  final String category;

  const SkillAssessmentScreen({super.key, required this.category});

  @override
  _SkillAssessmentScreenState createState() => _SkillAssessmentScreenState();
}

class _SkillAssessmentScreenState extends State<SkillAssessmentScreen> {
  final List<Map<String, dynamic>> questions = [
    // Sports category questions
    {'text': 'तुम्हाला मैदानी खेळ खेळायला आवडते का?', 'category': 'Sports'},
    {
      'text': 'तुम्हाला प्रतिस्पर्धात्मक खेळात भाग घेण्याची आवड आहे का?',
      'category': 'Sports'
    },
    {
      'text': 'तुम्हाला फिटनेस ट्रेनिंग आणि फिटनेस वाढवण्याची आवड आहे का?',
      'category': 'Sports'
    },
    {'text': 'तुम्हाला इतरांना खेळ शिकवायला आवडेल का?', 'category': 'Sports'},
    {
      'text':
          'तुम्हाला शारीरिक क्षमता वाढवण्यासाठी कठोर प्रशिक्षणाची आवड आहे का?',
      'category': 'Sports'
    },
    {
      'text': 'तुम्हाला सामूहिक खेळांचा अनुभव घेण्यात मजा येते का?',
      'category': 'Sports'
    },
    {
      'text':
          'तुम्हाला धावण्याची, पोहण्याची किंवा सायकल चालवण्याची आवड आहे का?',
      'category': 'Sports'
    },
    {
      'text': 'तुम्हाला खेळाच्या नियोजनात सक्रिय असण्याची आवड आहे का?',
      'category': 'Sports'
    },
    {'text': 'तुम्हाला खेळांचे नियम शिकायला आवडतात का?', 'category': 'Sports'},
    {
      'text':
          'तुम्हाला शारीरिक तंदुरुस्तीसाठी धैर्य आणि चिकाटीचा सामना करायला आवडतो का?',
      'category': 'Sports'
    },
    {
      'text':
          'तुम्हाला एखाद्या खेळातील तुमच्या कौशल्यांचे परीक्षण करायला आवडते का?',
      'category': 'Sports'
    },
    {
      'text': 'तुम्हाला सुद्धा आपल्या शारीरिक गोलांचा मागोवा ठेवायला आवडतो का?',
      'category': 'Sports'
    },
    {
      'text':
          'तुम्हाला मॅरेथॉन किंवा साहसी स्पर्धांमध्ये भाग घ्यायला आवडेल का?',
      'category': 'Sports'
    },
    {
      'text':
          'तुम्हाला ताज्या किंवा आपल्या जखमांच्या पुनर्निर्मितीची कधीही चिंता करायला आवडते का?',
      'category': 'Sports'
    },
    {
      'text':
          'तुम्हाला तंदुरुस्ती किंवा पौरुषासाठी विविध आहाराच्या पद्धतींमध्ये रस आहे का?',
      'category': 'Sports'
    },
    {
      'text': 'तुम्हाला एखाद्या खेळासाठी मानसिक तयारी करण्यात मजा येते का?',
      'category': 'Sports'
    },

    // Artist category questions
    {
      'text': 'तुम्हाला चित्रकला किंवा पेंटिंगची आवड आहे का?',
      'category': 'Artist'
    },
    {'text': 'तुम्हाला संगीत किंवा नृत्याची आवड आहे का?', 'category': 'Artist'},
    {'text': 'तुम्हाला रंगांची जुळवाजुळव आवडते का?', 'category': 'Artist'},
    {
      'text': 'तुम्हाला ग्राफिक डिझाइन किंवा डिजिटल आर्ट मध्ये रुचि आहे का?',
      'category': 'Artist'
    },
    {
      'text': 'तुम्हाला सृजनशीलतेने काही नवीन तयार करण्याची आवड आहे का?',
      'category': 'Artist'
    },
    {
      'text': 'तुम्हाला चित्र काढताना भावना व्यक्त करायला आवडते का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला शास्त्रीय संगीत किंवा वाद्यवृंदांच्या प्रत्येक मूडचा अनुभव घेण्यात मजा येते का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला नाविन्यपूर्ण कला रूपांमध्ये प्रयोग करण्याची आवड आहे का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला कोणत्याही कलाकाराचा आदर्श घेऊन त्याच्या शैलीत काम करण्याची आवड आहे का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला हाताने तयार केलेले कला देखावे आणि आकर्षक दिसावे यासाठी वेळ द्यायला आवडते का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला रंग आणि रूपांची सुसंगतता सुधारण्यासाठी कौशल्य दाखवायला आवडते का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला कला प्रदर्शनी किंवा संग्रहालयांना भेट द्यायला आवडते का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला काही अनोख्या शैलींमध्ये चित्र काढून स्वनिर्मितीचा अनुभव घेणे आवडते का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला सांस्कृतिक कलेचे किंवा ऐतिहासिक शिल्पकलेचे प्रदर्शन करण्यात रुचि आहे का?',
      'category': 'Artist'
    },
    {
      'text':
          'तुम्हाला रंगमंच किंवा नृत्यप्रदर्शनाच्या सादरीकरणात सक्रिय असण्याची आवड आहे का?',
      'category': 'Artist'
    },
    {
      'text': 'तुम्हाला पेंटिंग किंवा डिजिटल कला सादरीकरणे शिकायला आवडतात का?',
      'category': 'Artist'
    },

    // Maths category questions
    {
      'text': 'तुम्हाला गणितातील सुस्पष्टता आणि लॉजिकचा आदर करता का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला आकडेवारी आणि समीकरणे सोडवण्यात आनंद मिळतो का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला समजून घेऊन कठीण गणित सोडवण्याची आवड आहे का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला गणिताचे नियम आणि सूत्र शिकायला आवडते का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला गणिताचा वापर करून तंत्रज्ञानावर काम करायला आवडते का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला लॉजिक पझल्स सोडवण्यात आनंद मिळतो का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला त्रिकोणमितीचे, रेखाशास्त्राचे किंवा सांख्यिकीचे तत्त्वज्ञान समजून घेण्यात रुचि आहे का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला गणिताच्या अभ्यासात वेळ घालवताना आनंद मिळतो का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला सांख्यिकीचे विश्लेषण किंवा अ‍ॅल्गेब्रिक समीकरण सोडवायला आवडते का?',
      'category': 'Maths'
    },
    {
      'text': 'तुम्हाला गणिताच्या परीक्षांसाठी तयारी करतांना आवडते का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला समांतर रेषांमधील समतोल सिद्धांत समजून घेण्यात रुचि आहे का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला गणिताच्या सूत्रांचा अभ्यास आणि त्यांचा वापर करून समस्या सोडवणे आवडते का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला गणिताच्या मदतीने तंत्रज्ञानावर काम करण्याची आवड आहे का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला अंकगणितातील संकल्पना आणि सूत्रांचा वापर करून प्रॅक्टिकल समस्या सोडवण्याची आवड आहे का?',
      'category': 'Maths'
    },
    {
      'text':
          'तुम्हाला विश्लेषणात्मक गणिताच्या अभ्यासामध्ये समाधान मिळवण्याची आवड आहे का?',
      'category': 'Maths'
    },
  ];

  final Map<String, int> categoryScores = {};
  late List<Map<String, dynamic>> filteredQuestions;
  int currentQuestion = 0;

  final Map<String, List<String>> careerSuggestions = {
    'Sports': [
      'Athlete',
      'Sports Coach',
      'Fitness Trainer',
      'Sports Psychologist',
      'Sports Analyst',
      'Personal Trainer',
      'Physical Therapist',
      'Sports Nutritionist',
      'Sports Journalist',
      'Referee/Umpire',
    ],
    'Artist': [
      'Painter',
      'Graphic Designer',
      'Animator',
      'Sculptor',
      'Illustrator',
      'Fashion Designer',
      'Photographer',
      'Film Director',
      'Video Game Designer',
      'Visual Artist',
    ],
    'Maths': [
      'Data Scientist',
      'Actuary',
      'Mathematician',
      'Statistician',
      'Operations Research Analyst',
      'Quantitative Analyst',
      'Mathematics Professor',
      'Software Developer',
      'Cryptographer',
      'Financial Analyst',
    ],
  };

  @override
  void initState() {
    super.initState();
    filteredQuestions = questions
        .where((question) => question['category'] == widget.category)
        .toList();
    filteredQuestions.shuffle(Random());
  }

  void answerQuestion(bool answer) {
    if (answer) {
      categoryScores[widget.category] =
          (categoryScores[widget.category] ?? 0) + 1;
    }

    if (currentQuestion < filteredQuestions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      List<String> suggestions = [];

      if (categoryScores[widget.category] != null &&
          categoryScores[widget.category]! > 0) {
        if (widget.category == 'Sports') {
          // Sports category decision-making based on competitiveness and teaching interest
          if (categoryScores[widget.category]! >= 4) {
            suggestions = [
              'Athlete',
              'Sports Analyst',
              'Sports Journalist'
            ]; // Highly competitive users
          } else if (categoryScores[widget.category]! == 3) {
            suggestions = [
              'Sports Coach',
              'Personal Trainer',
              'Sports Psychologist'
            ]; // Users with an interest in teaching others
          } else {
            suggestions = [
              'Fitness Trainer',
              'Sports Nutritionist',
              'Referee/Umpire'
            ]; // General fitness-focused users
          }
        } else if (widget.category == 'Artist') {
          // Artist category decision-making based on traditional art vs. digital design
          if (categoryScores[widget.category]! >= 4) {
            suggestions = [
              'Painter',
              'Sculptor',
              'Fashion Designer'
            ]; // Users who like traditional or fine arts
          } else if (categoryScores[widget.category]! == 3) {
            suggestions = [
              'Graphic Designer',
              'Illustrator',
              'Photographer'
            ]; // Users interested in digital and modern art
          } else {
            suggestions = [
              'Animator',
              'Video Game Designer',
              'Film Director'
            ]; // Users who prefer animation or motion design
          }
        } else if (widget.category == 'Maths') {
          // Maths category decision-making based on practical application vs. pure maths
          if (categoryScores[widget.category]! >= 4) {
            suggestions = [
              'Data Scientist',
              'Quantitative Analyst',
              'Software Developer'
            ]; // Users interested in applying maths in tech and data analysis
          } else if (categoryScores[widget.category]! == 3) {
            suggestions = [
              'Actuary',
              'Operations Research Analyst',
              'Cryptographer'
            ]; // Users interested in applying maths in finance and risk assessment
          } else {
            suggestions = [
              'Mathematician',
              'Professor of Mathematics',
              'Statistician'
            ]; // Users who enjoy theoretical or academic maths
          }
        }
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            category: widget.category,
            suggestions: suggestions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bb1_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(Icons.question_mark_rounded,
                        size: 40, color: Colors.yellow),
                    const SizedBox(height: 10),
                    Text(
                      filteredQuestions[currentQuestion]['text'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => answerQuestion(true),
                    icon: Icon(Icons.thumb_up, size: 28, color: Colors.white),
                    label: const Text('हो', style: TextStyle(fontSize: 22)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () => answerQuestion(false),
                    icon: Icon(Icons.thumb_down, size: 28, color: Colors.white),
                    label: const Text('नाही', style: TextStyle(fontSize: 22)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
