import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome package
import 'topics/ai_content.dart';
import 'topics/cybersecurity_content.dart';
import 'topics/data_science_content.dart';
import 'topics/blockchain_content.dart';
import 'topics/iot_content.dart';

class CareerGuidanceScreen extends StatelessWidget {
  final List<Map<String, dynamic>> topics = [
    aiContent,
    cybersecurityContent,
    dataScienceContent,
    blockchainContent,
    iotContent,
  ];

  CareerGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting the screen width to dynamically adjust card size
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Guidance Module'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of cards per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            // Adjust the childAspectRatio based on screen width
            childAspectRatio:
            (screenWidth / 2) / 250, // Adjust height for smaller screens
          ),
          itemCount: topics.length,
          itemBuilder: (context, index) {
            final topic = topics[index];
            IconData icon;

            // Assign icons based on topic title
            switch (topic['title']) {
              case 'Artificial Intelligence':
                icon = FontAwesomeIcons.robot;
                break;
              case 'Cybersecurity':
                icon = FontAwesomeIcons.shieldHalved;
                break;
              case 'Data Science':
                icon = FontAwesomeIcons.chartLine;
                break;
              case 'Blockchain':
                icon = FontAwesomeIcons.link;
                break;
              case 'Internet of Things':
                icon = FontAwesomeIcons.wifi;
                break;
              default:
                icon = FontAwesomeIcons.userGear; // Default icon
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(topic: topic),
                  ),
                );
              },
              child: Card(
                color: Colors.blue[800],
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.symmetric(
                    vertical: 8), // Margin for spacing between cards
                child: Padding(
                  padding:
                  const EdgeInsets.all(16.0), // Padding inside the card
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: FaIcon(
                          icon,
                          size: 40,
                          color: Colors.blue[900],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        topic['title'] ?? 'No Title',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          topic['shortDescription'] ?? 'No Description',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow
                              .ellipsis, // Ensures content is truncated
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}

class TopicDetailScreen extends StatelessWidget {
  final Map<String, dynamic> topic;

  const TopicDetailScreen({super.key, required this.topic});

  // Function to launch the URL
  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic['title'] ?? 'Topic Details'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[850],
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.greenAccent, width: 2),
                  color: Colors.black87,
                ),
                child: Text(
                  topic['title'] ?? 'No Title',
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),

              // Importance Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.greenAccent, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Importance:\n${topic['importance']}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // How to Use Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.greenAccent, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'How to Use:\n${topic['howToUse']}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Avoid Misuse Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.greenAccent, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Avoid Misuse:\n${topic['avoidMisuse']}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Story Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.greenAccent, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Story:\n${topic['story']}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Moral Ethics Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.greenAccent, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Moral Ethics:\n${topic['moralEthics']}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Video Links Section
              if (topic['videoLinks'] != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width:
                    double.infinity, // Take the entire width of the screen
                    margin:
                    const EdgeInsets.symmetric(vertical: 8.0), // Add margin
                    padding: const EdgeInsets.all(
                        16.0), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.white, width: 2), // Border styling
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Video Resources:',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...List.generate(
                            topic['videoLinks'].length,
                                (index) {
                              final video = topic['videoLinks'][index];
                              return Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                                child: GestureDetector(
                                  onTap: () => _launchURL(video['url']),
                                  child: ElevatedButton(
                                    onPressed: () => _launchURL(video['url']),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                    ),
                                    child: Text(
                                      video['title'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),

              // Roadmap Section
              if (topic['roadmap'] != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    margin:
                    const EdgeInsets.symmetric(vertical: 8.0), // Add margin
                    padding: const EdgeInsets.all(
                        16.0), // Padding inside the container
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.greenAccent, width: 2),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '${topic['title']} Learning Roadmap',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                        ...List.generate(
                          topic['roadmap']['stages'].length,
                              (index) {
                            final stage = topic['roadmap']['stages'][index];
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.greenAccent),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${stage['stage']} Stage',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      stage['description'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
