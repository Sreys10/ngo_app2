import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

  // Function to launch a URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshops'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
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
                Text(
                  'Online Workshops on Waste Management',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.compost,
                  title: '1. Composting at Home',
                  description:
                      'Learn how to turn kitchen waste into nutrient-rich compost.',
                  url: 'https://youtu.be/iukbMVXIYKA?si=9ns6E0QdB2OuNZO_',
                  buttonText: 'Watch Composting Workshop',
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.electrical_services,
                  title: '2. E-Waste Management',
                  description:
                      'Understand the importance of recycling electronic waste.',
                  url: 'https://youtu.be/MQLadfsvfLo?si=lb0yGy8_oYrjvAXf',
                  buttonText: 'Watch E-Waste Workshop',
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.delete,
                  title: '3. Wet & Dry Waste Segregation',
                  description:
                      'Learn how to properly segregate wet and dry waste.',
                  url: 'https://youtu.be/A8udcpxDLtc?si=tpz05tNwBj3JCIvI',
                  buttonText: 'Watch Wet & Dry Waste Workshop',
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.female,
                  title: '4. Sanitary Pad Disposal (For Girl Child)',
                  description:
                      'Safe and eco-friendly disposal methods for sanitary pads.',
                  url: 'https://youtu.be/ShcRkeSv8w4?si=YahDqGra1o_ji1Px',
                  buttonText: 'Watch Sanitary Pad Disposal Workshop',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build a workshop card
  Widget _buildWorkshopCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String url,
    required String buttonText,
  }) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                Icon(icon, size: width * 0.08, color: Colors.blue),
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
            SizedBox(height: height * 0.01),
            Text(
              description,
              style: TextStyle(
                fontSize: width * 0.04,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: height * 0.02),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(url);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.02,
                    horizontal: width * 0.1,
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
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
}
