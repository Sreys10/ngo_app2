import 'package:flutter/material.dart';
import 'environmental_resources_page.dart';
import 'management_page.dart';
import 'recycling_page.dart';
import 'waste_disposal_page.dart';
import 'dashboard.dart'; // Import the dashboard.dart file

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment Page'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
        actions: [
          GestureDetector(
            onTap: () {
              // Navigate to the DashboardPage when the avatar is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
            child: CircleAvatar(
              radius: 20, // Set the size of the circle
              backgroundColor: Colors.white, // Background color of the circle
              child: ClipOval(
                child: Image.asset(
                  'assets/pf.png', // Replace with your profile image asset
                  width: 40, // Set the width of the image
                  height: 40, // Set the height of the image
                  fit: BoxFit.cover, // Ensures the image fits inside the circle
                ),
              ),
            ),
          ),
          const SizedBox(
              width: 16), // Add some space between the avatar and the edge
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildCustomButton(
              context,
              'Environmental Resources',
              Icons.nature_people,
              const EnvironmentalResourcesPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'Management',
              Icons.settings,
              const ManagementPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'Recycling',
              Icons.recycling,
              const RecyclingPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'Waste Disposal',
              Icons.delete_forever,
              const WasteDisposalPage(),
            ),
            const SizedBox(height: 32), // Add some spacing before the GIF
            _buildGif(), // Add GIF here
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(
      BuildContext context, String text, IconData icon, Widget page) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.green,
        shadowColor: Colors.greenAccent,
        elevation: 8,
      ),
    );
  }

  // Widget to display the GIF
  Widget _buildGif() {
    return Center(
      child: Image.asset(
        'assets/env.gif', // Replace with the correct path to your GIF
        height: 200, // You can adjust the height and width as needed
        width: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
