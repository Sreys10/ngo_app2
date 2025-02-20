import 'package:flutter/material.dart';
import 'experiments.dart';
import 'news.dart';
import 'science-story.dart';
import 'quiz_screen.dart';
import 'carries_guidance_screen.dart';

void main() {
  runApp(AvaliScienceApp());
}

class AvaliScienceApp extends StatelessWidget {
  const AvaliScienceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avali Science and Tech',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        title: Text(
          'Avali Science and Tech',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[600],
        elevation: 4,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover the World of Science!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.indigo[800],
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  SectionCard(
                    title: 'Science Stories',
                    icon: Icons.book_rounded,
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScienceStoriesListScreen()),
                      );
                    },
                  ),
                  SectionCard(
                    title: 'Experiments',
                    icon: Icons.science_rounded,
                    color: Colors.orangeAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExperimentsListScreen()),
                      );
                    },
                  ),
                  SectionCard(
                    title: 'Science News',
                    icon: Icons.newspaper_rounded,
                    color: Colors.purpleAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsListScreen()),
                      );
                    },
                  ),
                  SectionCard(
                    title: 'Quiz',
                    icon: Icons.quiz_rounded,
                    color: Colors.redAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                QuizScreen(ageGroup: '12-14')),
                      );
                    },
                  ),
                  SectionCard(
                    title: 'Career Roadmap',
                    icon: Icons.work_outline_rounded,
                    color: Colors.teal,
                    onTap: () {
                      // Navigate to Career Roadmap screen (to be implemented)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CareerGuidanceScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
