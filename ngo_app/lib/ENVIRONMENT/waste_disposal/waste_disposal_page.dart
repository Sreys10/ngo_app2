import 'package:flutter/material.dart';
import 'workshop.dart'; // कार्यशाळेचा पृष्ठ आयात करा

class WasteDisposalPage extends StatelessWidget {
  const WasteDisposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // स्क्रीनची रुंदी मिळवा
    double height = MediaQuery.of(context).size.height; // स्क्रीनची उंची मिळवा

    return Scaffold(
      appBar: AppBar(
        title: const Text('कचरा व्यवस्थापन'),
        backgroundColor: Colors.green,
        elevation: 0, // AppBar ची सावली काढा
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.lightGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // हिरो विभाग
                Center(
                  child: Image.asset(
                    'assets/ENVIRONMENT/wm1.webp', // तुमचा इमेज ऍसेट जोडा
                    width: width * 0.8,
                    height: height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'कचरा व्यवस्थापन का महत्त्वाचे आहे:',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'योग्य कचरा व्यवस्थापन पर्यावरण व मानवी आरोग्याचे संरक्षण करण्यासाठी महत्त्वपूर्ण आहे. यासाठी:',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _buildFactCard(
                  context,
                  icon: Icons.eco,
                  title: 'तुम्हाला माहीत आहे का?',
                  description:
                      'दरवर्षी जागतिक स्तरावर २ अब्ज टन कचरा निर्माण होतो. त्यातील फक्त १६% पुनर्वापर केला जातो.',
                ),
                SizedBox(height: height * 0.02),
                _buildFactCard(
                  context,
                  icon: Icons.warning,
                  title: 'पर्यावरणावर परिणाम',
                  description:
                      'योग्य कचरा व्यवस्थापनाअभावी प्रदूषण, नैसर्गिक संसाधनांची नासाडी आणि हवामान बदल होतो.',
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'तुम्ही काय करू शकता:',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _buildActionCard(
                  context,
                  icon: Icons.school,
                  title: 'ऑनलाइन कार्यशाळा अटेंड करा',
                  description:
                      'कंपोस्टिंग, ई-कचरा व्यवस्थापन आणि टिकाऊ जीवनशैलीबद्दल कार्यशाळांमध्ये सामील व्हा.',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkshopPage(),
                      ),
                    );
                  },
                  buttonText: 'कार्यशाळा एक्सप्लोर करा',
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'अधिक संसाधने:',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildResourceItem(
                          context,
                          icon: Icons.compost,
                          text:
                              '१. घरी कंपोस्टिंग कसे करावे याबद्दल मार्गदर्शिका',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.electrical_services,
                          text: '२. ई-कचरा व्यवस्थापन व पुनर्वापर',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.warning,
                          text: '३. धोकादायक कचरा कसा योग्यरीत्या टाकावा',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.recycling,
                          text:
                              '४. स्थानिक पुनर्वापर केंद्रे व त्यांच्या नियमांबद्दल माहिती',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.eco,
                          text: '५. कचरा कमी करण्यासाठी टिकाऊ पर्याय',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: Text(
                    'एकत्रित प्रयत्नांनी बदल घडवून आणूया!',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // तथ्य कार्ड तयार करण्यासाठी सहाय्यक फंक्शन
  Widget _buildFactCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description}) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Row(
          children: [
            Icon(icon, size: width * 0.08, color: Colors.green),
            SizedBox(width: width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: width * 0.02),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // क्रिया कार्ड तयार करण्यासाठी सहाय्यक फंक्शन
  Widget _buildActionCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String description,
      required VoidCallback onPressed,
      required String buttonText}) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: width * 0.08, color: Colors.green),
                SizedBox(width: width * 0.03),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: width * 0.02),
            Text(
              description,
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: width * 0.02),
            Center(
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1,
                    vertical: width * 0.03,
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // संसाधन आयटम तयार करण्यासाठी सहाय्यक फंक्शन
  Widget _buildResourceItem(BuildContext context,
      {required IconData icon, required String text}) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Row(
        children: [
          Icon(icon, size: width * 0.06, color: Colors.green),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
