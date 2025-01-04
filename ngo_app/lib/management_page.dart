import 'package:flutter/material.dart';

class ManagementPage extends StatelessWidget {
  const ManagementPage({super.key});

  Widget _buildExpandableSection({
    required String title,
    required String imagePath,
    required List<Map<String, String>> content,
    required Color cardColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Section Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Expandable Content
          ExpansionTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A5F7A),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: content.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: cardColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: cardColor.withOpacity(0.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['subtitle']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['content']!,
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environmental Management'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Background Image
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/hero_management.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Resource Management Guide',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Learn about managing different environmental resources',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Content Sections with Images
            _buildExpandableSection(
              title: 'Water Resource Management',
              imagePath: 'assets/wrm2.gif',
              cardColor: Colors.blue,
              content: [
                {
                  'subtitle': 'Current Global Status',
                  'content':
                      '• Global freshwater demand increasing by 1% annually\n'
                          '• 785 million people lack basic drinking water access\n'
                          '• Agriculture consumes 70% of available freshwater\n'
                          '• Industrial use accounts for 19% of consumption'
                },
                {
                  'subtitle': 'Management Strategies',
                  'content': '• Install water-efficient fixtures\n'
                      '• Implement drip irrigation\n'
                      '• Harvest rainwater\n'
                      '• Treat and reuse greywater\n'
                      '• Monitor water quality'
                },
              ],
            ),

            _buildExpandableSection(
              title: 'Forest Resource Management',
              imagePath: 'assets/frm.jpg',
              cardColor: Colors.green,
              content: [
                {
                  'subtitle': 'Current Challenges',
                  'content': '• 15 billion trees cut annually\n'
                      '• 46% of forests degraded globally\n'
                      '• 137 species lost daily due to deforestation\n'
                      '• Forest fires increasing by 14% yearly'
                },
                {
                  'subtitle': 'Management Approaches',
                  'content': '• Selective harvesting\n'
                      '• Reforestation programs\n'
                      '• Forest certification\n'
                      '• Protected areas establishment\n'
                      '• Indigenous knowledge integration'
                },
              ],
            ),

            _buildExpandableSection(
              title: 'Air Quality Management',
              imagePath: 'assets/aqm.gif',
              cardColor: Colors.purple,
              content: [
                {
                  'subtitle': 'Key Issues',
                  'content': '• 90% of people breathe polluted air\n'
                      '• 7 million premature deaths annually\n'
                      '• Transportation contributes 29% of emissions\n'
                      '• Indoor air pollution affects 3 billion people'
                },
                {
                  'subtitle': 'Management Solutions',
                  'content': '• Vehicle inspection programs\n'
                      '• Industrial filtration systems\n'
                      '• Clean fuel standards\n'
                      '• Zero-emission zones\n'
                      '• Air quality monitoring networks'
                },
              ],
            ),

            _buildExpandableSection(
              title: 'Waste Management',
              imagePath: 'assets/wm.gif',
              cardColor: Colors.orange,
              content: [
                {
                  'subtitle': 'Current Statistics',
                  'content': '• 2.01 billion tons of waste generated annually\n'
                      '• Only 13.5% globally recycled\n'
                      '• Plastic waste increases by 3% yearly\n'
                      '• E-waste growing by 21% since 2014'
                },
                {
                  'subtitle': 'Management Systems',
                  'content': '• Source separation\n'
                      '• Composting programs\n'
                      '• Recycling facilities\n'
                      '• Extended producer responsibility\n'
                      '• Zero waste initiatives'
                },
              ],
            ),

            const SizedBox(height: 20),

            // Call to Action
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add navigation to detailed resources or activities
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Start Management Activity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
