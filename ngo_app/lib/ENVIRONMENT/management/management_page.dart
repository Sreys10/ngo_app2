import 'package:flutter/material.dart';
import 'carbon_footprint.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  Widget _buildExpandableSection({
    required String title,
    required String imagePath,
    required List<Map<String, String>> content,
    required Color cardColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
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
          ExpansionTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A5F7A),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: cardColor.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['subtitle']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['content']!,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरण व्यवस्थापन'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/ENVIRONMENT/rm.gif'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'संसाधन व्यवस्थापन मार्गदर्शक',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'विविध पर्यावरणीय संसाधनांचे व्यवस्थापन जाणून घ्या',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildExpandableSection(
              title: 'जल संसाधन व्यवस्थापन',
              imagePath: 'assets/ENVIRONMENT/wrm2.gif',
              cardColor: Colors.blue,
              content: [
                {
                  'subtitle': 'वर्तमान जागतिक स्थिती',
                  'content':
                      '• वार्षिक १% ने वाढणारी जागतिक गोड्या पाण्याची मागणी\n'
                          '• ७८५ दशलक्ष लोकांना पिण्याच्या पाण्याची मूलभूत सुविधा नाही\n'
                          '• शेती ७०% उपलब्ध गोडे पाणी वापरते\n'
                          '• औद्योगिक वापर १९% आहे'
                },
                {
                  'subtitle': 'व्यवस्थापन धोरणे',
                  'content': '• पाणी-कार्यक्षम साधने स्थापित करा\n'
                      '• ठिबक सिंचन राबवा\n'
                      '• पावसाचे पाणी साठवा\n'
                      '• ग्रे वॉटर प्रक्रिया आणि पुनर्वापर\n'
                      '• पाण्याची गुणवत्ता तपासा'
                },
              ],
            ),
            _buildExpandableSection(
              title: 'वन संसाधन व्यवस्थापन',
              imagePath: 'assets/ENVIRONMENT/frm.jpg',
              cardColor: Colors.green,
              content: [
                {
                  'subtitle': 'सध्याची आव्हाने',
                  'content': '• वार्षिक १५ अब्ज झाडे तोडली जातात\n'
                      '• जागतिक स्तरावर ४६% जंगले नष्ट झाली\n'
                      '• जंगलतोडीमुळे दररोज १३७ प्रजाती नष्ट होतात\n'
                      '• जंगलातील आग वार्षिक १४% ने वाढत आहे'
                },
                {
                  'subtitle': 'व्यवस्थापन दृष्टिकोन',
                  'content': '• निवडक वृक्षतोड\n'
                      '• वनीकरण कार्यक्रम\n'
                      '• वन प्रमाणीकरण\n'
                      '• संरक्षित क्षेत्रांची स्थापना\n'
                      '• स्थानिक ज्ञानाचे एकत्रीकरण'
                },
              ],
            ),
            _buildExpandableSection(
              title: 'वायू गुणवत्ता व्यवस्थापन',
              imagePath: 'assets/ENVIRONMENT/aqm.gif',
              cardColor: Colors.purple,
              content: [
                {
                  'subtitle': 'प्रमुख समस्या',
                  'content': '• ९०% लोक प्रदूषित हवा श्वास घेतात\n'
                      '• वार्षिक ७ दशलक्ष अकाली मृत्यू\n'
                      '• वाहतूक २९% उत्सर्जनास कारणीभूत\n'
                      '• घरातील हवा प्रदूषण ३ अब्ज लोकांना प्रभावित करते'
                },
                {
                  'subtitle': 'व्यवस्थापन उपाय',
                  'content': '• वाहन तपासणी कार्यक्रम\n'
                      '• औद्योगिक फिल्टर प्रणाली\n'
                      '• स्वच्छ इंधन मानके\n'
                      '• शून्य-उत्सर्जन क्षेत्रे\n'
                      '• हवा गुणवत्ता निरीक्षण नेटवर्क'
                },
              ],
            ),
            _buildExpandableSection(
              title: 'कचरा व्यवस्थापन',
              imagePath: 'assets/ENVIRONMENT/wm.gif',
              cardColor: Colors.orange,
              content: [
                {
                  'subtitle': 'सध्याची आकडेवारी',
                  'content': '• वार्षिक २.०१ अब्ज टन कचरा निर्माण होतो\n'
                      '• जागतिक स्तरावर केवळ १३.५% पुनर्चक्रीकरण\n'
                      '• प्लास्टिक कचरा वार्षिक ३% ने वाढतो\n'
                      '• २०१४ पासून ई-कचरा २१% वाढला'
                },
                {
                  'subtitle': 'व्यवस्थापन प्रणाली',
                  'content': '• स्रोतावर वर्गीकरण\n'
                      '• कंपोस्टिंग कार्यक्रम\n'
                      '• पुनर्चक्रीकरण सुविधा\n'
                      '• विस्तारित उत्पादक जबाबदारी\n'
                      '• शून्य कचरा उपक्रम'
                },
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarbonFootprintPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'कार्बन फूटप्रिंट मोजा',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
