import 'package:flutter/material.dart';
import 'diy_videos.dart'; // Import the DIY videos file
import 'gamification.dart'; // Import the gamification file

class RecyclingPage extends StatelessWidget {
  const RecyclingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycling Guide'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                'Why Recycling Matters',
                'Recycling is crucial for environmental conservation and sustainable living. It helps reduce waste in landfills, conserves natural resources, and decreases greenhouse gas emissions.',
              ),
              const SizedBox(height: 20),
              _buildSection(
                'Key Recycling Categories',
                null,
                children: [
                  _buildRecyclingCategory(
                    'Paper & Cardboard',
                    'Newspapers, magazines, cardboard boxes, office paper',
                    'Saves 17 trees and 7,000 gallons of water per ton recycled',
                    Icons.description,
                  ),
                  _buildRecyclingCategory(
                    'Plastics',
                    'PET bottles, containers, packaging materials',
                    'Reduces oil consumption and CO2 emissions',
                    Icons.local_drink,
                  ),
                  _buildRecyclingCategory(
                    'Glass',
                    'Bottles, jars, containers',
                    'Can be recycled endlessly without quality loss',
                    Icons.wine_bar,
                  ),
                  _buildRecyclingCategory(
                    'Metal',
                    'Aluminum cans, steel containers, foil',
                    'Saves 95% of energy compared to new production',
                    Icons.menu_open,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSection(
                'DIY Upcycling Projects',
                'Transform waste into valuable items:',
                children: [
                  _buildUpcyclingProject(
                    'Clothes to Bags',
                    'Convert old t-shirts into reusable shopping bags',
                  ),
                  _buildUpcyclingProject(
                    'Plastic Bottle Planters',
                    'Create vertical gardens using plastic bottles',
                  ),
                  _buildUpcyclingProject(
                    'Glass Jar Organizers',
                    'Transform jars into storage solutions',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSection(
                'Environmental Impact',
                'Every small action counts:',
                children: [
                  _buildImpactCard(
                    'Recycling one aluminum can',
                    'Saves enough energy to power a TV for 3 hours',
                  ),
                  _buildImpactCard(
                    'Recycling one glass bottle',
                    'Saves enough energy to power a computer for 30 minutes',
                  ),
                  _buildImpactCard(
                    'Recycling one ton of paper',
                    'Saves 17 trees and 7,000 gallons of water',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSection(
                'Tips for Better Recycling',
                '• Clean containers before recycling\n'
                    '• Remove non-recyclable parts\n'
                    '• Check local recycling guidelines\n'
                    '• Avoid contamination with food waste\n'
                    '• Flatten cardboard boxes\n'
                    '• Keep materials separated',
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DIYVideosPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Explore DIY Videos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LeaderboardPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View Leaderboard',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String? content,
      {List<Widget>? children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        if (content != null)
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        if (children != null) ...children,
      ],
    );
  }

  Widget _buildRecyclingCategory(
    String title,
    String items,
    String impact,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Items: $items'),
            Text(
              'Impact: $impact',
              style: const TextStyle(
                color: Colors.green,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcyclingProject(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.recycling, color: Colors.green),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }

  Widget _buildImpactCard(String action, String impact) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.eco, color: Colors.green),
        title: Text(action),
        subtitle: Text(impact),
      ),
    );
  }
}
