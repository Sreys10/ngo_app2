import 'package:flutter/material.dart';
import 'diy_videos.dart'; // DIY व्हिडिओ फाइल आयात करा
import 'gamification.dart'; // गेमिफिकेशन फाइल आयात करा

class RecyclingPage extends StatelessWidget {
  const RecyclingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पुनर्वापर मार्गदर्शिका'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // हिरो सेक्शन
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/ENVIRONMENT/recycle.gif'), // आपले इमेज ऍसेट जोडा
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'आज पुनर्वापर करा, उद्या वाचवा',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'पुनर्वापर का महत्वाचे आहे?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'पुनर्वापर पर्यावरण संवर्धनासाठी आणि टिकाऊ जीवनासाठी अत्यावश्यक आहे. हे लँडफिल्समधील कचरा कमी करते, नैसर्गिक संसाधने वाचवते, आणि हरितगृह वायू उत्सर्जन कमी करते.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'महत्त्वाच्या पुनर्वापर श्रेणी',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildRecyclingCategory(
                    'कागद व कार्डबोर्ड',
                    'न्यूजपेपर, मासिके, कार्डबोर्ड बॉक्स, ऑफिस पेपर',
                    'प्रत्येक टन पुनर्वापरित कागदामुळे १७ झाडे आणि ७,००० गॅलन पाणी वाचते',
                    Icons.description,
                    Colors.blue,
                  ),
                  _buildRecyclingCategory(
                    'प्लास्टिक',
                    'PET बाटल्या, कंटेनर्स, पॅकेजिंग साहित्य',
                    'तेलाचा वापर आणि CO2 उत्सर्जन कमी करते',
                    Icons.local_drink,
                    Colors.orange,
                  ),
                  _buildRecyclingCategory(
                    'काच',
                    'बाटल्या, जार, कंटेनर्स',
                    'गुणवत्ता न घालवता सतत पुनर्वापर होऊ शकते',
                    Icons.wine_bar,
                    Colors.red,
                  ),
                  _buildRecyclingCategory(
                    'धातू',
                    'अॅल्युमिनियम कॅन, स्टील कंटेनर्स, फॉइल',
                    'नवीन उत्पादनाच्या तुलनेत ९५% ऊर्जा वाचवते',
                    Icons.menu_open,
                    Colors.green,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'DIY अपसायकलिंग प्रकल्प',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildUpcyclingProject(
                    'कपडे बॅग्समध्ये',
                    'जुने टी-शर्ट्स पुन्हा वापरण्यायोग्य खरेदी बॅग्समध्ये बदला',
                    'assets/ENVIRONMENT/diy1.jpg',
                  ),
                  _buildUpcyclingProject(
                    'प्लास्टिक बाटल्या प्लांटर्स',
                    'प्लास्टिक बाटल्यांचा वापर करून उभे बगीचे तयार करा',
                    'assets/ENVIRONMENT/diy2.jpg',
                  ),
                  _buildUpcyclingProject(
                    'काचेचे जार आयोजक',
                    'जारचे साठवण उपायांमध्ये रूपांतर करा',
                    'assets/ENVIRONMENT/diy3.webp',
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'पर्यावरणीय प्रभाव',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildImpactCard(
                    'एक अॅल्युमिनियम कॅन पुनर्वापर करणे',
                    '३ तासांसाठी टीव्ही चालवण्यासाठी पुरेशी ऊर्जा वाचवते',
                    Icons.tv,
                  ),
                  _buildImpactCard(
                    'एक काचेची बाटली पुनर्वापर करणे',
                    '३० मिनिटांसाठी संगणक चालवण्यासाठी पुरेशी ऊर्जा वाचवते',
                    Icons.computer,
                  ),
                  _buildImpactCard(
                    'एक टन कागद पुनर्वापर करणे',
                    '१७ झाडे आणि ७,००० गॅलन पाणी वाचवते',
                    Icons.forest,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'पुनर्वापरासाठी उपयुक्त टिपा',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '• पुनर्वापर करण्यापूर्वी कंटेनर्स स्वच्छ करा\n• न पुनर्वापर होणारे भाग काढा\n• स्थानिक पुनर्वापर मार्गदर्शक तपासा\n• अन्न कचऱ्याने दूषित होणे टाळा\n• कार्डबोर्ड बॉक्स सपाट करा\n• साहित्य वेगळे ठेवा',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DIYVideosPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'DIY व्हिडिओ शोधा',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LeaderboardPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'लीडरबोर्ड पहा',
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

  Widget _buildRecyclingCategory(
      String title, String items, String benefit, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color, size: 40),
      title: Text(title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      subtitle: Text('$items\n\u2022 $benefit', style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildUpcyclingProject(
      String title, String description, String imagePath) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading:
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildImpactCard(String title, String description, IconData icon) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 40),
        title: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
