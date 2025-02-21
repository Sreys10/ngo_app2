import 'package:flutter/material.dart';
import 'emotion/emotion_first_page.dart';
import 'my_identity/my_identity_first_page.dart';
import 'post_test_page.dart';
import 'pre_test_page.dart';
import 'rights_and_responsibilities/lagnuage_selection.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 4,
        shadowColor: Colors.black26,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  context: context,
                  text: 'पूर्व चाचणी',
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade600, Colors.purple.shade400],
                  ),
                  onPressed: () => navigateTo(context, const PreTestPage()),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  text: 'माझी ओळख',
                  gradient: LinearGradient(
                    colors: [Colors.green.shade600, Colors.green.shade400],
                  ),
                  onPressed: () => navigateTo(context, MyIdentityFirstPage()),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  text: 'भावना',
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.blue.shade400],
                  ),
                  onPressed: () =>
                      navigateTo(context, const EmotionFirstPage()),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  text: 'हक्क आणि जबाबदाऱ्या',
                  gradient: LinearGradient(
                    colors: [Colors.red.shade600, Colors.red.shade400],
                  ),
                  onPressed: () =>
                      navigateTo(context, const LanguageSelectionPage()),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  context: context,
                  text: 'उत्तर चाचणी',
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade600, Colors.orange.shade400],
                  ),
                  onPressed: () => navigateTo(context, const PostTestPage()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Gradient gradient,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 300,
      height: 70,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
