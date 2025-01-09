import 'package:flutter/material.dart';
import 'workshop.dart'; // Import the workshop page

class WasteDisposalPage extends StatelessWidget {
  const WasteDisposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; // Get screen width
    double height = MediaQuery.of(context).size.height; // Get screen height

    return Scaffold(
      appBar: AppBar(
        title: const Text('Waste Disposal'),
        backgroundColor: Colors.green,
        elevation: 0, // Remove app bar shadow
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
                // Hero Section
                Center(
                  child: Image.asset(
                    'assets/wm1.webp', // Add your image asset
                    width: width * 0.8,
                    height: height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'Why Waste Management Matters:',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Proper waste disposal is crucial for protecting the environment and human health. Here’s why:',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _buildFactCard(
                  context,
                  icon: Icons.eco,
                  title: 'Did You Know?',
                  description:
                      'Over 2 billion tons of waste are generated globally each year. Only 16% of it is recycled.',
                ),
                SizedBox(height: height * 0.02),
                _buildFactCard(
                  context,
                  icon: Icons.warning,
                  title: 'Environmental Impact',
                  description:
                      'Improper waste disposal leads to pollution, habitat destruction, and climate change.',
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'What You Can Do:',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: height * 0.02),
                _buildActionCard(
                  context,
                  icon: Icons.gamepad,
                  title: 'Play the AR Waste Disposal Game',
                  description:
                      'Learn how to segregate waste in a fun and interactive way using augmented reality.',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('AR Game coming soon!')),
                    );
                  },
                  buttonText: 'Launch Game',
                ),
                SizedBox(height: height * 0.02),
                _buildActionCard(
                  context,
                  icon: Icons.school,
                  title: 'Attend Online Workshops',
                  description:
                      'Join workshops on composting, e-waste management, and sustainable living.',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkshopPage(),
                      ),
                    );
                  },
                  buttonText: 'Explore Workshops',
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'Additional Resources:',
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
                          text: '1. Guide on composting at home',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.electrical_services,
                          text: '2. E-waste management and recycling',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.warning,
                          text: '3. How to properly dispose of hazardous waste',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.recycling,
                          text: '4. Local recycling centers and their rules',
                        ),
                        _buildResourceItem(
                          context,
                          icon: Icons.eco,
                          text: '5. Sustainable alternatives to reduce waste',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Center(
                  child: Text(
                    'Together, we can make a difference!',
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

  // Helper function to build a fact card
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

  // Helper function to build an action card
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
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
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
                  padding: EdgeInsets.symmetric(
                    vertical: width * 0.02,
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

  // Helper function to build a resource item with an icon
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
