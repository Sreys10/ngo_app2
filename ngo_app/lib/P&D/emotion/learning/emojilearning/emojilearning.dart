// lib/emoji_learning_page.dart
import 'package:flutter/material.dart';

import 'emojis/angrypage.dart';
import 'emojis/Boredompage.dart';
import 'emojis/Confidencepage.dart';
import 'emojis/confusionpage.dart';
import 'emojis/Curiositypage.dart';
import 'emojis/disgustpage.dart';
import 'emojis/Embarrassmentpage.dart';
import 'emojis/Excitementpage.dart';
import 'emojis/fearpage.dart';
import 'emojis/Frustrationpage.dart';
import 'emojis/Gratitudepage.dart';
import 'emojis/Guiltpage.dart';
import 'emojis/happypage.dart';
import 'emojis/Jealousypage.dart';
import 'emojis/laughingpage.dart';
import 'emojis/Lonelinesspage.dart';
import 'emojis/lovepage.dart';
import 'emojis/Reliefpage.dart';
import 'emojis/sadpage.dart';
import 'emojis/Shynesspage.dart';
import 'emojis/surprisedpage.dart';
import 'emojis/thinkingpage.dart';
import 'emojis/Tirednesspage.dart';

class EmojiLearningPage extends StatelessWidget {
  const EmojiLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("इमोजींसह शिकणे"),
        backgroundColor:
            const Color.fromARGB(255, 126, 87, 194), // Updated color
        centerTitle: true,
        elevation: 4, // Add a slight shadow
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.pink.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: emojis.length,
          itemBuilder: (context, index) {
            // Accessing the emoji and emotion name using index
            return EmotionButton(
              emoji: emojis[index]['emoji']!,
              emotionName: emojis[index]['name']!,
              onPress: () {
                // Navigate to the individual emoji page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      switch (emojis[index]['name']) {
                        case 'आनंदी':
                          return const HappyPage();
                        case 'दु:ख':
                          return const SadPage();
                        case 'राग':
                          return const AngryPage();
                        case 'भिती':
                          return const FearPage();
                        case 'आश्चर्य':
                          return const SurprisedPage();
                        case 'विचार':
                          return const ThinkingPage();
                        case 'थकवा':
                          return const TirednessPage();
                        case 'आत्मविश्वास':
                          return const ConfidencePage();
                        case 'कंटाळा':
                          return const BoredomPage();
                        case 'गोंधळ':
                          return const ConfusionPage();
                        case 'किळस':
                          return const DisgustPage();
                        case 'लज्जा':
                          return const EmbarrassmentPage();
                        case 'उत्सुकता':
                          return const ExcitementPage();
                        case 'त्रास':
                          return const FrustrationPage();
                        case 'कृतज्ञता':
                          return const GratitudePage();
                        case 'पश्चात्ताप':
                          return const GuiltPage();
                        case 'मत्सर':
                          return const JealousyPage();
                        case 'हसणे':
                          return const LaughingPage();
                        case 'एकटेपण':
                          return const LonelinessPage();
                        case 'प्रेम':
                          return const LovePage();
                        case 'सुटका':
                          return const ReliefPage();
                        case 'लाज':
                          return const ShynessPage();
                        case 'कुतूहल':
                          return const CuriosityPage();
                        default:
                          return const SizedBox(); // Default case
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

// EmotionButton Widget for each emoji button
class EmotionButton extends StatelessWidget {
  final String emoji;
  final String emotionName;
  final VoidCallback onPress;

  const EmotionButton({
    super.key,
    required this.emoji,
    required this.emotionName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            emoji,
            width: 100, // Adjust size as needed
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            emotionName,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

// List of Emojis with names in Marathi
final List<Map<String, String>> emojis = [
  {'emoji': 'assets/PD/emojis/happy.gif', 'name': 'आनंदी'},
  {'emoji': 'assets/PD/emojis/sad.gif', 'name': 'दु:ख'},
  {'emoji': 'assets/PD/emojis/राग.gif', 'name': 'राग'},
  {'emoji': 'assets/PD/emojis/fear.gif', 'name': 'भिती'},
  {'emoji': 'assets/PD/emojis/surprised.gif', 'name': 'आश्चर्य'},
  {'emoji': 'assets/PD/emojis/thinking.gif', 'name': 'विचार'},
  {'emoji': 'assets/PD/emojis/tired.gif', 'name': 'थकवा'},
  {'emoji': 'assets/PD/emojis/confidence.gif', 'name': 'आत्मविश्वास'},
  {'emoji': 'assets/PD/emojis/boredom.gif', 'name': 'कंटाळा'},
  {'emoji': 'assets/PD/emojis/confusion.gif', 'name': 'गोंधळ'},
  {'emoji': 'assets/PD/emojis/disgust.gif', 'name': 'किळस'},
  {'emoji': 'assets/PD/emojis/embarrassment.gif', 'name': 'लज्जा'},
  {'emoji': 'assets/PD/emojis/excitement.gif', 'name': 'उत्सुकता'},
  {'emoji': 'assets/PD/emojis/frustration.gif', 'name': 'त्रास'},
  {'emoji': 'assets/PD/emojis/gratitude.gif', 'name': 'कृतज्ञता'},
  {'emoji': 'assets/PD/emojis/guilt.gif', 'name': 'पश्चात्ताप'},
  {'emoji': 'assets/PD/emojis/jealousy.gif', 'name': 'मत्सर'},
  {'emoji': 'assets/PD/emojis/laughing.gif', 'name': 'हसणे'},
  {'emoji': 'assets/PD/emojis/loneliness.gif', 'name': 'एकटेपण'},
  {'emoji': 'assets/PD/emojis/love.gif', 'name': 'प्रेम'},
  {'emoji': 'assets/PD/emojis/relief.gif', 'name': 'सुटका'},
  {'emoji': 'assets/PD/emojis/shyness.gif', 'name': 'लाज'},
  {'emoji': 'assets/PD/emojis/curiosity.gif', 'name': 'कुतूहल'},
];
