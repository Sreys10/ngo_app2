// gamification.dart
import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeaderboardSection(),
              const SizedBox(height: 20),
              _buildChallengesSection(context),
              const SizedBox(height: 20),
              _buildBadgesSection(),
              const SizedBox(height: 20),
              _buildRewardsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Leaderboard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('#${index + 1}'),
              title: Text('User ${index + 1}'),
              trailing: Text('${(index + 1) * 100} Points'),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChallengesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Challenges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text('Challenge ${index + 1}'),
                subtitle: Text('Complete to earn ${(index + 1) * 50} points'),
                trailing: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Challenge ${index + 1} completed!'),
                      ),
                    );
                  },
                  child: const Text('Complete'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBadgesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Badges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildBadge('Recycling Novice'),
            _buildBadge('Recycling Expert'),
            _buildBadge('Eco Warrior'),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String badgeName) {
    return Chip(
      label: Text(badgeName),
      backgroundColor: Colors.green[100],
      avatar: const Icon(Icons.eco, color: Colors.green),
    );
  }

  Widget _buildRewardsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rewards',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.card_giftcard, color: Colors.green),
            title: const Text('10% Off Coupon'),
            subtitle: const Text('Redeem for completing challenges'),
            trailing: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Coupon redeemed!'),
                  ),
                );
              },
              child: const Text('Redeem'),
            ),
          ),
        ),
      ],
    );
  }
}
