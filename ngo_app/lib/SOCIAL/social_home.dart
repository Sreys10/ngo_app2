import 'package:flutter/material.dart';
import 'story_time.dart';
import 'family_quiz_screen.dart';
import 'my_society_activity.dart';

class SocialHomePage extends StatelessWidget {
  const SocialHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🌟 Social 🌟',
          style: TextStyle(
            fontSize: 28, // Bigger Font Size
            fontWeight: FontWeight.bold,
            letterSpacing: 2, // Adds space between letters
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent, // Vibrant Color Bar
        elevation: 10, // Adds shadow for 3D effect
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/SOCIAL/background2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Story Time',
                color: Colors.deepPurpleAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StoryTimePage()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Family Quiz',
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => FamilyQuizScreenPage()));
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'My Society Activity',
                color: Colors.orangeAccent,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => QuizPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 8,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
