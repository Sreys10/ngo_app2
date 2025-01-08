import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class DIYVideosPage extends StatelessWidget {
  const DIYVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIY Video Suggestions'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSuggestionCard(
                context,
                'Unused Clothes',
                'What can you do with old clothes?',
                'https://youtu.be/yLZgrSpCAVs?si=nNorQLuMemIah2mK',
              ),
              _buildSuggestionCard(
                context,
                'Unused Plastics',
                'Creative ways to reuse plastic bottles',
                'https://youtu.be/Sr6DgQ18drA?si=MAqN5Wb9h5p0weO8',
              ),
              _buildSuggestionCard(
                context,
                'Old Glass Jars',
                'Transform jars into beautiful organizers',
                'https://youtu.be/i1kwUR3nhIk?si=S0lqdEUXUG4bAxfA',
              ),
              _buildSuggestionCard(
                context,
                'Cardboard Boxes',
                'DIY projects using cardboard',
                'https://youtu.be/_-TmHqU9aTc?si=WUFtbz_s9wkdfOob',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionCard(
    BuildContext context,
    String title,
    String description,
    String ytLink,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.video_library, color: Colors.green),
        title: Text(title),
        subtitle: Text(description),
        onTap: () async {
          // Open the YouTube link using url_launcher
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
