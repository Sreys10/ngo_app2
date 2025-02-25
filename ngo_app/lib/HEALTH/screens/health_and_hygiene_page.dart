import 'package:flutter/material.dart';

class HealthAndHygienePage extends StatelessWidget {
  const HealthAndHygienePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health and Hygiene - Pros and Cons'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.green.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'Pros of Health and Hygiene',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Pros Section with Expandable Details
              _buildExpandableTopic('Boosts Immune System', 'By maintaining proper hygiene, we prevent the entry of harmful pathogens. This keeps our immune system strong and more capable of fighting diseases.'),
              _buildExpandableTopic('Prevents Diseases', 'Good hygiene practices, like washing hands and keeping the environment clean, drastically reduce the risk of infections and diseases.'),

              const SizedBox(height: 20),
              const Text(
                'Cons of Health and Hygiene',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),

              // Cons Section with Expandable Details
              _buildExpandableTopic('Overuse of Hygiene Products', 'Excessive use of antibacterial soaps and sanitizers can disrupt the natural balance of bacteria on our skin, leading to issues like dry skin and antibiotic resistance.'),
              _buildExpandableTopic('Mental Strain', 'Sometimes, obsessive cleanliness can lead to anxiety or obsessive-compulsive disorder (OCD), causing mental strain on individuals.'),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create an expandable card for pros and cons
  Widget _buildExpandableTopic(String title, String details) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white.withOpacity(0.8),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              details,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
