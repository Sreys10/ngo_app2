import 'package:flutter/material.dart';

class VisionBoardScreen extends StatefulWidget {
  const VisionBoardScreen({super.key});

  @override
  _VisionBoardScreenState createState() => _VisionBoardScreenState();
}

class _VisionBoardScreenState extends State<VisionBoardScreen> {
  List<Map<String, dynamic>> visionItems = [];

  final Map<String, List<Map<String, dynamic>>> categories = {
    'करियर मार्ग': [
      {'name': 'इंजिनिअर', 'icon': Icons.engineering},
      {'name': 'डॉक्टर', 'icon': Icons.local_hospital},
      {'name': 'कलाकार', 'icon': Icons.palette},
      {'name': 'शास्त्रज्ञ', 'icon': Icons.science},
      {'name': 'उद्योजक', 'icon': Icons.business},
      {'name': 'शिक्षक', 'icon': Icons.school},
    ],
    'छंद': [
      {'name': 'वाचन', 'icon': Icons.book},
      {'name': 'खेळ', 'icon': Icons.sports_esports},
      {'name': 'साहित्यिक क्रीडा', 'icon': Icons.sports_soccer},
      {'name': 'संगीत', 'icon': Icons.music_note},
      {'name': 'स्वयंपाक', 'icon': Icons.restaurant},
      {'name': 'प्रवास', 'icon': Icons.flight},
    ],
    'शक्ती': [
      {'name': 'नेतृत्व', 'icon': Icons.group},
      {'name': 'सृजनशीलता', 'icon': Icons.brush},
      {'name': 'धैर्य', 'icon': Icons.hourglass_bottom},
      {'name': 'संघटित कार्य', 'icon': Icons.groups},
      {'name': 'समस्या सोडवणे', 'icon': Icons.lightbulb},
      {'name': 'संचार कौशल्य', 'icon': Icons.mic},
    ],
    'कमकुवतता': [
      {'name': 'प्रलंबित करणे', 'icon': Icons.timer_off},
      {'name': 'अविचार', 'icon': Icons.hourglass_empty},
      {'name': 'आत्मसंशय', 'icon': Icons.sentiment_dissatisfied},
      {'name': 'लाजाळूपण', 'icon': Icons.person_off},
      {'name': 'अति विचार', 'icon': Icons.bubble_chart},
      {'name': 'एकाग्रतेची कमतरता', 'icon': Icons.blur_circular},
    ],
  };

  final Map<String, String> feedbackMessages = {
    'इंजिनिअर': "इंजिनिअर्स वास्तविक समस्यांचे समाधान करतात. तुमच्या कौशल्यांचा विकास करत राहा!",
    'डॉक्टर': "डॉक्टर होणे एक पवित्र ध्येय आहे. सहानुभूती आणि समर्पण ठेवा.",
    'कलाकार': "कलाकार जगात सौंदर्य आणतात. आपली सर्जनशीलता व्यक्त करत रहा.",
    'शास्त्रज्ञ': "शास्त्रज्ञ ज्ञानाच्या सीमांना पुढे ढकलतात. कुतूहल ठेवा आणि अन्वेषण करा.",
    'उद्योजक': "उद्योजक नवकल्पना आणि मूल्य निर्माण करतात. मोठ्या विचारात राहा!",
    'शिक्षक': "शिक्षक भविष्य घडवतात. तुमची आवड अनेकांचे जीवन प्रेरित करू शकते.",
    'नेतृत्व': "तुमचं नेतृत्व गुण इतरांना प्रेरित करू शकतात. याचा उपयोग फरक करण्यासाठी करा.",
    'सृजनशीलता': "तुमची सृजनशीलता तुम्हाला समस्यांचे अनोखे उपाय शोधण्यास मदत करेल.",
    'धैर्य': "धैर्य तुम्हाला अडचणींवर मात करण्यास मदत करेल. चालत राहा!",
    'संघटित कार्य': "संघटित कार्य स्वप्न सत्य करतं. सहकार्य ही एक मौल्यवान कौशल्य आहे.",
    'समस्या सोडवणे': "तुमचे समस्या सोडवण्याचे कौशल्य प्रभावी उपाय तयार करू शकते.",
    'संचार कौशल्य': "चांगला संवाद जुळवण्याची क्षमता वाढवतो. सराव करत राहा!",
    'वाचन': "वाचन तुमचं ज्ञान वाढवतं. तुमच्या मनाला पोषण देत राहा.",
    'खेळ': "खेळ तुम्हाला सक्रिय ठेवतात आणि संघटित कार्य शिकवतात. हे करत राहा!",
    'साहित्यिक क्रीडा': "साहित्यिक क्रीडा तुम्हाला रणनीतिक विचार सुधारण्यास मदत करतात. इतर क्रियाकलापांसोबत संतुलन ठेवा.",
    'संगीत': "संगीत आत्म्याचं खाद्य आहे. तुमच्या आवडीला वाढवा.",
    'स्वयंपाक': "स्वयंपाक एक सर्जनशील आणि उपयुक्त कौशल्य आहे. नवनवीन प्रयोग करत राहा!",
    'प्रवास': "प्रवास तुमचा दृष्टीकोन विस्तृत करतो. नवीन स्थळे अन्वेषण करत राहा.",
    'प्रलंबित करणे': "प्रलंबित करणे चांगल्या वेळेच्या व्यवस्थापनाने पार केली जाऊ शकते. तुम्ही हे करू शकता!",
    'अविचार': "धीर धरा, यामुळे तुम्हाला अडचणी चांगल्या प्रकारे हाताळता येतील.",
    'आत्मसंशय': "स्वत:वर विश्वास ठेवा. तुम्ही आश्चर्यकारक गोष्टी करू शकता!",
    'लाजाळूपण': "लाजाळूपण मात करण्यामुळे तुम्ही अधिक चांगल्या प्रकारे व्यक्त होऊ शकता. छोटे पाऊल टाका.",
    'अति विचार': "अति विचार टाकण्यासाठी वर्तमान क्षणावर लक्ष केंद्रित करा.",
    'एकाग्रतेची कमतरता': "एकाग्रता सुधारण्यासाठी मनोयोग वापरा. छोट्या गोष्टींपासून सुरुवात करा.",
  };

  // Show selection dialog
  void _showSelectionDialog(String category) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$category निवडा', style: TextStyle(fontWeight: FontWeight.bold)),
          content: SizedBox(
            height: 300,
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: categories[category]!.length,
              itemBuilder: (context, index) {
                final item = categories[category]![index];
                return ListTile(
                  leading: Icon(item['icon'], color: Colors.teal),
                  title: Text(item['name']),
                  onTap: () {
                    setState(() {
                      visionItems.add({
                        'category': category,
                        'item': item['name'],
                        'color': _getCategoryColor(category),
                      });
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Get color based on category
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'करियर मार्ग':
        return const Color.fromARGB(255, 157, 207, 248);
      case 'छंद':
        return const Color.fromARGB(255, 193, 150, 226);
      case 'शक्ती':
        return const Color.fromARGB(255, 183, 242, 185);
      case 'कमकुवतता':
        return const Color.fromARGB(255, 249, 166, 174);
      default:
        return const Color.fromARGB(204, 238, 238, 238);
    }
  }

  // Show feedback dialog
  void _showFeedback() {
    String feedback = visionItems
        .map((item) =>
            "${item['item']}: ${feedbackMessages[item['item']] ?? "विशिष्ट अभिप्राय उपलब्ध नाही."}")
        .join("\n\n");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("तुमचा व्हिजन बोर्ड अभिप्राय", style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(child: Text(feedback)),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("समजलं!"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('दृष्टीफलक', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                visionItems.clear();
              });
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 247, 174, 78), // Pastel pink for app bar
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: visionItems.length,
              itemBuilder: (context, index) {
                final item = visionItems[index];
                return Card(
                  color: item['color'],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      item['item'],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      item['category'],
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              },
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 12,
            children: categories.keys.map((category) {
              return ElevatedButton(
                onPressed: () => _showSelectionDialog(category),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 126, 207, 229),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text("अ‍ॅड $category"),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _showFeedback,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 124, 208, 150),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text("अभिप्राय मिळवा", style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
