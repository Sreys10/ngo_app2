import 'package:flutter/material.dart';
import '../environment_resource_page/environmental_resources_page.dart';
import '../management/management_page.dart';
import '../recycle/recycling_page.dart';
import '../waste_disposal/waste_disposal_page.dart';
import 'dashboard.dart';
import '../game/game_zone_page.dart';
import './waste_detect.dart'; // Import the new Waste Detection page

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरण'), // Environment Page in Marathi
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/pf.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildCustomButton(
              context,
              'कचरा शोध', // Waste Detection in Marathi
              Icons.search,
              const WasteDetectionPage(), // Navigate to WasteDetectionPage
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'पर्यावरणीय संसाधने', // Environmental Resources in Marathi
              Icons.nature_people,
              const EnvironmentalResourcesPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'व्यवस्थापन', // Management in Marathi
              Icons.settings,
              const ManagementPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'पुनर्चक्रण', // Recycling in Marathi
              Icons.recycling,
              const RecyclingPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'कचरा विल्हेवाट', // Waste Disposal in Marathi
              Icons.delete_forever,
              const WasteDisposalPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'गेम झोन', // Game Zone in Marathi
              Icons.videogame_asset,
              const GameZonePage(),
            ),
            const SizedBox(height: 32),
            _buildGif(),
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

  Widget _buildGif() {
    return Center(
      child: Image.asset(
        'assets/env.gif',
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
