import 'package:flutter/material.dart';
import 'questions_data.dart'; // Import your dataset file
import 'dart:math'; // For random number generation

class McqPage extends StatefulWidget {
  const McqPage({super.key});

  @override
  State<McqPage> createState() => _McqPageState();
}

class _McqPageState extends State<McqPage> {
  List<Map<String, dynamic>> questions = []; // To store all questions
  int currentQuestionIndex = 0; // Track the current question index
  int score = 0; // Track the score
  bool showResultGif = false; // Flag to control displaying GIF
  bool isCorrect = false; // Store if the answer is correct or wrong

  @override
  void initState() {
    super.initState();
    questions = List.from(questionsData); // Create a copy of questionsData
    questions.shuffle(Random()); // Shuffle the list to randomize the questions
    questions = questions.take(10).toList(); // Take the first 10 questions
  }

  // Function to handle answer selection
  void handleAnswer(int selectedIndex) {
    bool correct =
        selectedIndex == questions[currentQuestionIndex]['correct_option'];
    if (correct) {
      score++; // Increment the score if the answer is correct
    }

    setState(() {
      showResultGif = true; // Show the result GIF
      isCorrect = correct; // Determine if the answer is correct
    });

    // Display GIF for 2 seconds, then move to the next question
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showResultGif = false; // Hide the GIF
      });
      nextQuestion(); // Move to the next question
    });
  }

  // Function to proceed to the next question
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // Move to the next question
      });
    } else {
      // If it's the last question, show a decorative scoreboard
      showDialog(
        context: context,
        builder: (context) => Dialog(
          backgroundColor: Colors.orange.shade50,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "परीक्षा पूर्ण झाली!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                ),
                const SizedBox(height: 20),
                Text(
                  "तुमचे स्कोर:",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700),
                ),
                const SizedBox(height: 20),
                Text(
                  "$score / 10",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context); // Return to the previous screen
                  },
                  child: const Text(
                    "ठीक आहे",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      // Display an error message if the dataset is empty
      return Scaffold(
        appBar: AppBar(title: const Text("प्रश्नमंजूषा")),
        body: const Center(
          child: Text(
            "प्रश्न उपलब्ध नाहीत. कृपया डेटासेट तपासा.",
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("एमसीक्यू क्रियाकलाप"),
      ),
      body: Stack(
        children: [
          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Question Progress
                Text(
                  "प्रश्न ${currentQuestionIndex + 1} / ${questions.length}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Displaying the Image (face image)
                Center(
                  child: SizedBox(
                    height: 250, // Adjust height as needed
                    width: double.infinity, // Full width of the screen
                    child: Image.asset(
                      questions[currentQuestionIndex]
                          ['face_image'], // Dynamic image path
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'प्रतिमा सापडली नाही',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        );
                      },
                      fit: BoxFit.contain, // Ensure the image is not cropped
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Question Text
                Text(
                  questions[currentQuestionIndex]['question'] as String,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),

                // GridView to display options in 2x2 matrix
                GridView.builder(
                  shrinkWrap:
                      true, // This ensures GridView does not take up unnecessary space
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling in the GridView
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 options in each row
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                    childAspectRatio: 1, // Maintain the square shape for images
                  ),
                  itemCount: questions[currentQuestionIndex]['options'].length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () =>
                          handleAnswer(index), // Handle answer selection
                      child: Image.asset(
                        questions[currentQuestionIndex]['options']
                            [index], // Displaying the GIF
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Full-screen result GIF
          if (showResultGif)
            Container(
              // ignore: deprecated_member_use
              color:
                  Colors.black.withOpacity(0.8), // Semi-transparent background
              child: Center(
                child: Image.asset(
                  isCorrect
                      ? 'assets/PD/mcq/right.gif'
                      : 'assets/PD/mcq/wrong.gif', // Show correct/wrong GIF
                  width: 300, // Large size for GIF
                  height: 300, // Large size for GIF
                  fit: BoxFit.contain,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
