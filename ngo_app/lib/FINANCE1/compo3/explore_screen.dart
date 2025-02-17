import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final String career;
  final List<String> roadmapSteps;

  const ExploreScreen(
      {super.key, required this.career, required this.roadmapSteps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$career - Career Exploration'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/explore_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Basic Information Section
                const Text(
                  'Basic Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'The $career field is an exciting domain that involves diverse responsibilities, '
                  'key skills, and significant growth opportunities. This guide will walk you through '
                  'everything you need to know to pursue a successful career in $career.',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 20),

                // Career Roadmap Section
                const Text(
                  'Career Roadmap',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Follow these steps to build a successful career in $career:',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                ...roadmapSteps.asMap().entries.map((entry) {
                  int stepNumber = entry.key + 1;
                  String description = entry.value;
                  return _buildRoadmapStep(stepNumber, description);
                }),
                const SizedBox(height: 30),

                // Explore Further Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Explore More',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoadmapStep(int stepNumber, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.deepPurple,
            child: Text(
              '$stepNumber',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
