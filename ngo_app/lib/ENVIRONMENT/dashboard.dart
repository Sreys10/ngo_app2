import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Picture
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                    'assets/ENVIRONMENT/pf.png'), // Add your image asset
              ),
              const SizedBox(height: 20),
              // User Name
              const Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // User Bio
              const Text(
                'Software Developer | Flutter Enthusiast',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              // User Details Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Email
                    _buildUserInfoRow(Icons.email, 'john.doe@example.com'),
                    const SizedBox(height: 15),
                    // Phone Number
                    _buildUserInfoRow(Icons.phone, '+1 234 567 890'),
                    const SizedBox(height: 15),
                    // Location
                    _buildUserInfoRow(Icons.location_on, 'New York, USA'),
                    const SizedBox(height: 15),
                    // Joined Date
                    _buildUserInfoRow(
                        Icons.calendar_today, 'Joined January 2020'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Edit Profile Button
              ElevatedButton(
                onPressed: () {
                  // Add functionality to edit profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build user info rows
  Widget _buildUserInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
