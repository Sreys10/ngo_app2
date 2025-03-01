import 'package:flutter/material.dart';
import 'video_player_screen.dart'; // Import the video player screen

class WorkshopPage extends StatelessWidget {
  const WorkshopPage({super.key});

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
                  description: 'Learn how to turn kitchen waste into compost.',
                  videoPath: 'assets/ENVIRONMENT/videos/composting.mp4',
                  buttonText: 'Watch Composting Workshop',
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.electrical_services,
                  title: '2. E-Waste Management',
                  description:
                      'Understand the importance of recycling e-waste.',
                  videoPath: 'assets/ENVIRONMENT/videos/e_waste.mp4',
                  buttonText: 'Watch E-Waste Workshop',
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.delete,
                  title: '3. Wet & Dry Waste Segregation',
                  description: 'Learn proper waste segregation techniques.',
                  videoPath: 'assets/ENVIRONMENT/videos/waste_segregation.mp4',
                  buttonText: 'Watch Waste Segregation Workshop',
                ),
                SizedBox(height: height * 0.02),
                _buildWorkshopCard(
                  context,
                  icon: Icons.female,
                  title: '4. Sanitary Pad Disposal (For Girl Child)',
                  description: 'Safe and eco-friendly disposal methods.',
                  videoPath: 'assets/ENVIRONMNENT/videos/sanitary_pad.mp4',
                  buttonText: 'Watch Sanitary Pad Disposal Workshop',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkshopCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String videoPath,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VideoPlayerScreen(videoPath: videoPath),
                    ),
                  );
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
