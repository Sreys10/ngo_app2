import 'package:flutter/material.dart';
import 'video_player_screen.dart'; // Your existing video player screen

class LearningModule extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {
      'title': 'करियर मार्ग',
      'videoUrl': 'assets/PD/videos_my_learning/career-paths.mp4'
    },
    {'title': 'छंद', 'videoUrl': 'assets/PD/videos_my_learning/hobbies.mp4'},
    {
      'title': 'शक्ती',
      'videoUrl': 'assets/PD/videos_my_learning/strengths.mp4'
    },
    {
      'title': 'कमकुवतता',
      'videoUrl': 'assets/PD/videos_my_learning/weaknesses.mp4'
    },
    {
      'title': 'वाढीचा मानसिकता',
      'videoUrl': 'assets/PD/videos_my_learning/growth.mp4'
    },
  ];

  LearningModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('शिकण्याचा मॉड्यूल'),
        backgroundColor: const Color.fromARGB(
            255, 247, 174, 78), // Pastel pink for the app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 245, 240, 195),
              const Color.fromARGB(255, 242, 191, 139)
            ], // Pastel purple to pastel pink gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              color: Colors
                  .purple.shade50, // Light pastel purple background for cards
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                title: Text(
                  topics[index]['title']!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.purple.shade900),
                ),
                trailing: Icon(Icons.play_circle_fill,
                    color: Colors.deepPurple, size: 30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                        title: topics[index]['title']!,
                        videoUrl: topics[index]['videoUrl']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
