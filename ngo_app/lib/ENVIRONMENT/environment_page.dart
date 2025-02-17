import 'package:flutter/material.dart';
import './environment_resource_page/environmental_resources_page.dart';
import './management/management_page.dart';
import 'recycle/recycling_page.dart';
import 'waste_disposal/waste_disposal_page.dart';
import 'dashboard.dart';
import './game/game_zone_page.dart';
import 'survey/pre.dart';
import 'survey/post.dart';

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('पर्यावरण'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/ENVIRONMENT/Arise_Logo.png',
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
                  'assets/ENVIRONMENT/pf.png',
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
              'पर्यावरणीय संसाधने',
              Icons.nature_people,
              const EnvironmentalResourcesPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'व्यवस्थापन',
              Icons.settings,
              const ManagementPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'पुनर्चक्रण',
              Icons.recycling,
              const RecyclingPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'कचरा विल्हेवाट',
              Icons.delete_forever,
              const WasteDisposalPage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'गेम झोन',
              Icons.videogame_asset,
              const GameZonePage(),
            ),
            const SizedBox(height: 16),
            _buildCustomButton(
              context,
              'सर्वेक्षण',
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
      title: const Text('सर्वेक्षण निवडा'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading:
                const Icon(Icons.assignment_turned_in, color: Colors.green),
            title: const Text('प्री-टेस्ट'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PreTestPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment_outlined, color: Colors.green),
            title: const Text('पोस्ट-टेस्ट'),
            onTap: () {
              Navigator.pop(context);
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
        'assets/ENVIRONMENT/env.gif',
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
