import 'package:flutter/material.dart';
import '../environment_resource_page/environmental_resources_page.dart';
import '../management/management_page.dart';
import '../recycle/recycling_page.dart';
import '../waste_disposal/waste_disposal_page.dart';
import 'dashboard.dart';
import '../game/game_zone_page.dart';
import '../survey/pre.dart'; // Import the Pre-test page
import '../survey/post.dart'; // Import the Post-test page
import 'dart:async';

class EnvironmentPage extends StatefulWidget {
  const EnvironmentPage({super.key});

  @override
  _EnvironmentPageState createState() => _EnvironmentPageState();
}

class _EnvironmentPageState extends State<EnvironmentPage> {
  bool _animate = false;
  bool _showHome = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _animate = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _showHome = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_showHome) _buildHomePage(),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            top: _animate
                ? 10
                : MediaQuery.of(context).size.height / 2 -
                    80, // Centered for initial 160x160 size
            left: _animate
                ? 10
                : MediaQuery.of(context).size.width / 2 -
                    80, // Centered for initial 160x160 size
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _showHome ? 0.0 : 1.0,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: _animate ? 80 : 160,
                height: _animate ? 80 : 160,
                child: Image.asset(
                  'assets/Arise_Logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return const EnvironmentHomePage();
  }
}

class EnvironmentHomePage extends StatelessWidget {
  const EnvironmentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरण'), // Environment Page in Marathi
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/Arise_Logo.png', // Path to your logo image
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
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
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'सर्वेक्षण', // Survey in Marathi
              Icons.assignment,
              _buildSurveyOptions(context),
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

  Widget _buildSurveyOptions(BuildContext context) {
    return AlertDialog(
      title: const Text('सर्वेक्षण निवडा'), // Choose Survey in Marathi
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading:
                const Icon(Icons.assignment_turned_in, color: Colors.green),
            title: const Text('प्री-टेस्ट'), // Pre-test in Marathi
            onTap: () {
              Navigator.pop(context); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PreTestPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment_outlined, color: Colors.green),
            title: const Text('पोस्ट-टेस्ट'), // Post-test in Marathi
            onTap: () {
              Navigator.pop(context); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PostTestPage()),
              );
            },
          ),
        ],
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
