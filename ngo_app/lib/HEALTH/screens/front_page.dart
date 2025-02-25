import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anatomy_game.dart';
import 'rainbow_diet_quiz_page.dart';
import 'hormonal_changes_page.dart'; // Import the Hormonal Changes Page
import 'pre_test.dart'; // Import the PreTest Screen
import 'pro_test.dart'; // Import the ProTest Screen

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HEALTH AND HYGIENE',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[700], // Rich teal color
        elevation: 8,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // Add info screen if needed
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/HEALTH/hh.webp'), // Use the WebP image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            color: Colors.black
                .withOpacity(0.6), // Add slight overlay for better readability
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildCustomButton(
                    context,
                    'Body Part Labeling Game',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnatomyQuizGame(),
                        ),
                      );
                    },
                    Colors.orangeAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildCustomButton(
                    context,
                    'Rainbow Diet Quiz Game',
                    () {
                      _showColorSelectionDialog(context);
                    },
                    Colors.greenAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildCustomButton(
                    context,
                    'Body Hormonal Changes',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HormonalChangesPage(),
                        ),
                      );
                    },
                    Colors.blueAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildCustomButton(
                    context,
                    'Pros and Cons of the Games',
                    () {
                      _showProsAndConsDialog(context);
                    },
                    Colors.purpleAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildCustomButton(
                    context,
                    'Pre Test',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreTest(),
                        ),
                      );
                    },
                    Colors.redAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildCustomButton(
                    context,
                    'ProTest',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProTest(),
                        ),
                      );
                    },
                    Colors.pinkAccent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showColorSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Choose a Color',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _colorButton(context, Colors.red, 'Red'),
                _colorButton(context, Colors.orange, 'Orange'),
                _colorButton(context, Colors.yellow, 'Yellow'),
                _colorButton(context, Colors.green, 'Green'),
                _colorButton(context, Colors.blue, 'Blue'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _colorButton(BuildContext context, Color color, String colorName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          Navigator.pop(context); // Close the dialog
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RainbowDietQuizPage(color: color),
            ),
          );
        },
        child: Text(
          colorName,
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context, String text,
      VoidCallback onPressed, Color buttonColor) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          textStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _showProsAndConsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Pros and Cons',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pros and cons of different features will go here.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
