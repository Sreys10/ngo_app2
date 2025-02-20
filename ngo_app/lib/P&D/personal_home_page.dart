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
        title: const Text('एकत्रित अ‍ॅप'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // पूर्व चाचणी (Pre-Test) बटण
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreTestPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'पूर्व चाचणी',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            // "माझी ओळख" विभागाचे बटण
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyIdentityFirstPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'माझी ओळख',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            // "भावना" विभागाचे बटण
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EmotionFirstPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'भावना',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            // "हक्क आणि जबाबदाऱ्या" विभागाचे बटण
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguageSelectionPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'हक्क आणि जबाबदाऱ्या',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            // उत्तर चाचणी (Post-Test) बटण
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostTestPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'उत्तर चाचणी',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
