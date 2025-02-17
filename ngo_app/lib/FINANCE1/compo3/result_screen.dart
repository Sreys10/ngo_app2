import 'career_screen.dart';
import 'package:flutter/material.dart';
import 'explore_screen.dart'; // Assuming you have the ExploreScreen defined.

final Map<String, List<String>> careerRoadmaps = {
  'Athlete': [
    'Engage in regular physical training and participate in competitions.',
    'Seek mentorship from experienced athletes or coaches.',
    'Join professional training programs or sports academies.',
    'Participate in regional, national, and international tournaments.',
    'Work with a sports psychologist to improve mental resilience.',
  ],
  'Painter': [
    'Explore different painting styles and mediums.',
    'Enroll in fine arts courses or workshops.',
    'Build a portfolio showcasing your artwork.',
    'Participate in local art exhibitions or online platforms.',
    'Network with art communities to gain visibility and inspiration.',
  ],
  'Data Scientist': [
    'Master programming languages like Python or R.',
    'Learn data visualization tools like Tableau or Power BI.',
    'Gain expertise in machine learning algorithms and statistical modeling.',
    'Work on real-world projects to build your portfolio.',
    'Stay updated with the latest trends in AI and big data technologies.',
  ],
};

class ResultScreen extends StatelessWidget {
  final String category;
  final List<String> suggestions;

  const ResultScreen(
      {super.key, required this.category, required this.suggestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Results'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/doctor_bg.jpeg'))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Career Suggestion Box
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.pinkAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.pinkAccent.shade100,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Career Suggestions:',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Comic Sans MS',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (suggestions.isNotEmpty)
                        Column(
                          children: suggestions
                              .map((suggestion) => GestureDetector(
                                    onTap: () {
                                      // Fetch the roadmap steps for the selected suggestion
                                      final roadmapSteps =
                                          careerRoadmaps[suggestion] ??
                                              ['No roadmap available.'];

                                      // Navigate to ExploreScreen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ExploreScreen(
                                            career: suggestion,
                                            roadmapSteps: roadmapSteps,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      elevation: 5,
                                      margin: const EdgeInsets.only(top: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.work,
                                                size: 40,
                                                color: Colors.deepPurple),
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: Text(
                                                suggestion,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Comic Sans MS',
                                                  color: Colors.pinkAccent,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Restart Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => CareerScreen()),
                        (route) => false,
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.restart_alt, color: Colors.white, size: 24),
                        SizedBox(width: 10),
                        Text(
                          'Restart',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
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
}
