import 'package:flutter/material.dart';
import 'skill_assessment_screen.dart';

class CareerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Sports',
      'icon': Icons.sports,
      'color': Colors.orangeAccent,
    },
    {
      'name': 'Maths',
      'icon': Icons.calculate,
      'color': Colors.greenAccent,
    },
    {
      'name': 'Artist',
      'icon': Icons.brush,
      'color': Colors.pinkAccent,
    },
  ];

  CareerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Category'),
        backgroundColor: Colors.deepPurple,
        elevation: 8,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:
                  20, // Increased spacing between cards for better readability
              mainAxisSpacing: 20,
              childAspectRatio: 1.4, // More elongated cards for a modern look
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SkillAssessmentScreen(
                          category: categories[index]['name']),
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  transform: Matrix4.identity()
                    ..scale(1.05), // Slight scale effect on tap
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        categories[index]['color'].withOpacity(0.7),
                        categories[index]['color'],
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        25), // Rounded corners for a smooth look
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated Icon by using TweenAnimationBuilder
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.8, end: 1.2),
                          duration: Duration(milliseconds: 300),
                          builder: (context, value, child) {
                            return Icon(
                              categories[index]['icon'],
                              size: 60 * value, // Animate the size of the icon
                              color: Colors.white,
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(
                            fontSize: 26, // Larger text for better visibility
                            fontWeight:
                                FontWeight.bold, // Bold text for emphasis
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ],
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
      ),
    );
  }
}
