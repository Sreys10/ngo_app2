import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the package

class VirtualFieldPage extends StatelessWidget {
  const VirtualFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Field'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildVideoCard(
            context,
            title: 'Understanding Climate Change',
            ytLink: 'https://www.youtube.com/watch?v=IJoAcD0oUww',
          ),
          _buildVideoCard(
            context,
            title: 'Water Conservation Techniques',
            ytLink: 'https://www.youtube.com/watch?v=nTcFXJT0Fsc',
          ),
          _buildVideoCard(
            context,
            title: 'Waste Management Strategies',
            ytLink: 'https://www.youtube.com/watch?v=6jQ7y_qQYUA',
          ),
          _buildVideoCard(
            context,
            title: 'Biodiversity Protection',
            ytLink: 'https://www.youtube.com/watch?v=rclOz8Fsbmg',
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context,
      {required String title, required String ytLink}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.play_arrow),
        onTap: () async {
          if (await canLaunch(ytLink)) {
            await launch(ytLink);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Could not launch $ytLink'),
              ),
            );
          }
        },
      ),
    );
  }
}
