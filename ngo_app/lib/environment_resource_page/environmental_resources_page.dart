import 'package:flutter/material.dart';
import 'er_game.dart';
import 'vr.dart';

class EnvironmentalResourcesPage extends StatelessWidget {
  const EnvironmentalResourcesPage({super.key});

  Widget _buildSectionWithImage({
    required String title,
    required String content,
    required String imagePath,
    Color backgroundColor = const Color(0xFFE8F5E9),
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A5F7A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Color(0xFF424242),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environmental Resources'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero section with background image
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/hero_environment.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Protecting Our Planet\nStarting With You',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionWithImage(
                    title: 'Understanding Climate Change',
                    imagePath: 'assets/climate_change.jpg',
                    content: '''
• Global temperature rise of 1.1°C since pre-industrial era
• Arctic warming twice as fast as global average
• Sea levels rising 3.3mm annually
• Extreme weather events increased by 20%
• Greenhouse gas concentrations at record highs

How You Can Help:
• Calculate and reduce your carbon footprint
• Switch to renewable energy sources
• Use energy-efficient appliances
• Support climate action policies
• Educate others about climate change''',
                  ),
                  _buildSectionWithImage(
                    title: 'Water Conservation',
                    imagePath: 'assets/water_conservation.jpg',
                    backgroundColor: const Color(0xFFE3F2FD),
                    content: '''
Current Status:
• Only 1% of Earth's water is accessible freshwater
• 2.3 billion people face water scarcity
• 80% of wastewater goes untreated
• Water demand increasing 1% annually

Daily Actions:
• Install water-efficient fixtures (saves 30-50%)
• Fix leaks (saves 180 liters/day)
• Collect rainwater for gardens
• Choose drought-resistant plants
• Take shorter showers (save 45L per 5 minutes)''',
                  ),
                  _buildSectionWithImage(
                    title: 'Waste Management',
                    imagePath: 'assets/waste_management.jpg',
                    backgroundColor: const Color(0xFFFFF3E0),
                    content: '''
Global Impact:
• 2.01 billion tons of waste generated annually
• Only 13.5% of waste is recycled globally
• 8 million tons of plastic enter oceans yearly
• Landfills contribute to greenhouse gases

Take Action:
• Follow 5Rs: Refuse, Reduce, Reuse, Repurpose, Recycle
• Start composting (reduces waste by 30%)
• Avoid single-use plastics
• Buy products with minimal packaging
• Support zero-waste stores''',
                  ),
                  _buildSectionWithImage(
                    title: 'Biodiversity Protection',
                    imagePath: 'assets/biodiversity.webp',
                    backgroundColor: const Color(0xFFF3E5F5),
                    content: '''
Current Crisis:
• 1 million species at risk of extinction
• 68% decline in wildlife since 1970
• 32% reduction in forest area
• Coral reefs declining 4% annually

How to Help:
• Plant native species in your garden
• Support wildlife conservation
• Choose sustainable products
• Reduce meat consumption
• Join local conservation efforts''',
                  ),
                  _buildSectionWithImage(
                    title: 'Get Involved',
                    imagePath: 'assets/community_action.jpg',
                    backgroundColor: const Color(0xFFE0F2F1),
                    content: '''
Community Actions:
• Join environmental organizations
• Participate in clean-up drives
• Start a school/community garden
• Organize awareness workshops
• Support local environmental initiatives

Digital Engagement:
• Use eco-tracking apps
• Join online environmental communities
• Share success stories
• Participate in citizen science
• Follow environmental news''',
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VirtualFieldPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Virtual Field',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const EnvironmentalResourcesGame(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Start Interactive Learning',
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
          ],
        ),
      ),
    );
  }
}
