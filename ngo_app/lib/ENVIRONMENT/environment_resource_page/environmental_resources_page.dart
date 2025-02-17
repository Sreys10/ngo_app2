import 'package:flutter/material.dart';
import 'er_game.dart';
import 'vr.dart';

class EnvironmentalResourcesPage extends StatelessWidget {
  const EnvironmentalResourcesPage({super.key});

  Widget _buildSectionWithImage({
    required String title,
    required String content,
    required String imagePath,
    Color backgroundColor = const Color(0xFFE8F5E9),
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A5F7A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF424242),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरणीय संसाधने'),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ENVIRONMENT/ev.gif'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'आपल्या ग्रहाचे संरक्षण\nआपल्यापासून सुरू होते!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionWithImage(
                    title: 'हवामान बदल समजून घेणे',
                    imagePath: 'assets/ENVIRONMENT/climate_change.jpg',
                    content: '''
• औद्योगिक क्रांतीपूर्वीच्या काळापासून १.१°C जागतिक तापमान वाढ
• आर्क्टिक जागतिक सरासरीपेक्षा दुप्पट वेगाने तापत आहे
• दरवर्षी ३.३ मिमी समुद्र पातळी वाढत आहे
• अतिशय हवामान घटनांमध्ये २०% वाढ
• हरितगृह वायूंची सांद्रता विक्रमी पातळीवर

आपण कसे मदत करू शकता:
• आपला कार्बन फूटप्रिंट मोजा आणि कमी करा
• नवीकरणीय ऊर्जा स्रोतांकडे वळा
• ऊर्जा-कार्यक्षम उपकरणे वापरा
• हवामान कृती धोरणांना पाठिंबा द्या
• हवामान बदलाबद्दल इतरांना शिक्षित करा''',
                  ),
                  _buildSectionWithImage(
                    title: 'पाणी संवर्धन',
                    imagePath: 'assets/ENVIRONMENT/water_conservation.jpg',
                    backgroundColor: const Color(0xFFE3F2FD),
                    content: '''
सध्याची स्थिती:
• पृथ्वीच्या पाण्यापैकी केवळ १% गोडे पाणी उपलब्ध
• २.३ अब्ज लोक पाणी टंचाईला सामोरे जात आहेत
• ८०% सांडपाणी अप्रक्रियित राहते
• पाण्याची मागणी दरवर्षी १% वाढत आहे

दैनंदिन कृती:
• पाणी-कार्यक्षम फिक्स्चर्स बसवा (३०-५०% बचत)
• गळती दुरुस्त करा (१८० लिटर/दिवस बचत)
• बागेसाठी पावसाचे पाणी जमा करा
• दुष्काळ-प्रतिरोधक वनस्पती निवडा
• कमी वेळ आंघोळ करा (५ मिनिटांत ४५ लिटर बचत)''',
                  ),
                  _buildSectionWithImage(
                    title: 'कचरा व्यवस्थापन',
                    imagePath: 'assets/ENVIRONMENT/waste_management.jpg',
                    backgroundColor: const Color(0xFFFFF3E0),
                    content: '''
जागतिक प्रभाव:
• वार्षिक २.०१ अब्ज टन कचरा निर्माण होतो
• जागतिक स्तरावर केवळ १३.५% कचरा पुनर्चक्रित केला जातो
• दरवर्षी ८ दशलक्ष टन प्लास्टिक समुद्रात जाते
• लँडफिल्स हरितगृह वायूंमध्ये योगदान देतात

कृती करा:
• ५आर अनुसरा: नकार द्या, कमी करा, पुन्हा वापरा, पुनर्वापर करा, पुनर्चक्रित करा
• कंपोस्टिंग सुरू करा (३०% कचरा कमी)
• एकदा वापरण्यायोग्य प्लास्टिक टाळा
• कमीत कमी पॅकेजिंग असलेले उत्पादने खरेदी करा
• शून्य-कचरा दुकानांना पाठिंबा द्या''',
                  ),
                  _buildSectionWithImage(
                    title: 'जैवविविधता संरक्षण',
                    imagePath: 'assets/ENVIRONMENT/biodiversity.webp',
                    backgroundColor: const Color(0xFFF3E5F5),
                    content: '''
सध्याचे संकट:
• १ दशलक्ष प्रजाती नामशेष होण्याच्या धोक्यात
• १९७० पासून वन्यजीवांमध्ये ६८% घट
• जंगल क्षेत्रात ३२% घट
• प्रवाळ खडक दरवर्षी ४% कमी होत आहेत

मदत कशी करावी:
• आपल्या बागेत देशी प्रजाती लावा
• वन्यजीव संवर्धनास पाठिंबा द्या
• शाश्वत उत्पादने निवडा
• मांस सेवन कमी करा
• स्थानिक संवर्धन प्रयत्नांमध्ये सामील व्हा''',
                  ),
                  _buildSectionWithImage(
                    title: 'सहभागी व्हा',
                    imagePath: 'assets/ENVIRONMENT/community_action.jpg',
                    backgroundColor: const Color(0xFFE0F2F1),
                    content: '''
समुदाय कृती:
• पर्यावरण संस्थांमध्ये सामील व्हा
• स्वच्छता मोहिमेत सहभागी व्हा
• शाळा/समुदाय बाग सुरू करा
• जागरूकता कार्यशाळा आयोजित करा
• स्थानिक पर्यावरण उपक्रमांना पाठिंबा द्या

डिजिटल सहभाग:
• इको-ट्रॅकिंग अॅप्स वापरा
• ऑनलाईन पर्यावरण समुदायांमध्ये सामील व्हा
• यशोगाथा शेअर करा
• नागरिक विज्ञानात सहभागी व्हा
• पर्यावरण बातम्या फॉलो करा''',
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VirtualFieldPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'व्हर्च्युअल फील्ड',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Increased height for more gap
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const EnvironmentalResourcesGame(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'इंटरॅक्टिव्ह लर्निंग सुरू करा',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
