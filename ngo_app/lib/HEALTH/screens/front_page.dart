import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anatomy_game.dart';
import 'rainbow_diet_quiz_page.dart';
import 'hormonal_changes_page.dart';
import 'pre_test.dart';
import 'pro_test.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'आरोग्य आणि स्वच्छता',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal[700],
        elevation: 8,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // आवश्यक असल्यास माहिती स्क्रीन जोडा
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/HEALTH/hh.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            color: Colors.black.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildCustomButton(
                    context,
                    'शरीर भाग लेबलिंग खेळ',
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
                    'इंद्रधनुष्य आहार प्रश्नमंजुषा खेळ',
                    () {
                      _showColorSelectionDialog(context);
                    },
                    Colors.greenAccent,
                  ),
                  const SizedBox(height: 25),
                  _buildCustomButton(
                    context,
                    'शरीर हार्मोनल बदल',
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
                    'प्री टेस्ट',
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
                    'प्रो टेस्ट',
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
            'रंग निवडा',
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _colorButton(context, Colors.red, 'लाल'),
                _colorButton(context, Colors.orange, 'नारंगी'),
                _colorButton(context, Colors.yellow, 'पिवळा'),
                _colorButton(context, Colors.green, 'हिरवा'),
                _colorButton(context, Colors.blue, 'निळा'),
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
          Navigator.pop(context);
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
}
