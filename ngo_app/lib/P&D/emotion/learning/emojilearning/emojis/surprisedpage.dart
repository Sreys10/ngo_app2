// lib/surprised_page.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SurprisedPage extends StatefulWidget {
  const SurprisedPage({super.key});

  @override
  State<SurprisedPage> createState() => _SurprisedPageState();
}

class _SurprisedPageState extends State<SurprisedPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/PD/videos/surprised.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the video is loaded before displaying it
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("आश्चर्य"),
        backgroundColor:
            const Color.fromARGB(255, 126, 87, 194), // Updated color
        centerTitle: true,
        elevation: 4, // Add a slight shadow
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink.shade100, Colors.pink.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Adjusted for consistency
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GIF Emoji Display from Assets
              Image.asset(
                'assets/PD/emojis/surprised.gif',
                height: 120, // Increased height for emoji
                width: 120, // Increased width for emoji
              ),
              const SizedBox(height: 20),

              // Emotion Title
              const Text(
                'आश्चर्य',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Emotion Description
              const Text(
                'आश्चर्य म्हणजे एखादी गोष्ट ऐकून किंवा पाहून होणारा धक्का, घबराट किंवा अनपेक्षित प्रतिक्रिया.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Video Player Section
              if (_controller.value.isInitialized)
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              else
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Text(
                    "व्हिडिओ लोड होत आहे...",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              const SizedBox(height: 10),

              // Play/Pause Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Text(
                  _controller.value.isPlaying ? "Pause Video" : "Play Video",
                ),
              ),
              const SizedBox(height: 30),

              // Example Scenarios
              const Text(
                'उदाहरण परिस्थिती:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),

              // Scenario 1
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 10, color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: const Text(
                      'तुम्ही एक गुपित ऐकता आणि ते ऐकून तुम्हाला पूर्णपणे आश्चर्यचकित होतो.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Scenario 2
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.circle, size: 10, color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: const Text(
                      'तुम्ही तुमच्या वयस्कर नातेवाईकांना अचानक एक नवीन आव्हान पार करत पाहता आणि ते आश्चर्यचकित होतात.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Example Images of Human Faces
              const Text(
                'आश्चर्य दर्शवणाऱ्या मानवी चेहऱ्यांचे उदाहरण:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),

              // Image 1
              Image.asset(
                'assets/PD/faces/surprised1.jpg',
                height: 250, // Increased height for image
                width: double.infinity,
                fit: BoxFit.contain, // Ensuring the image is not cropped
              ),
              const SizedBox(height: 10),

              // Image 2
              Image.asset(
                'assets/PD/faces/surprised2.jpg',
                height: 250, // Increased height for image
                width: double.infinity,
                fit: BoxFit.contain, // Ensuring the image is not cropped
              ),
              const SizedBox(height: 30),

              // Back Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the emoji list
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade400,
                  foregroundColor: Colors.white,
                ),
                child: const Text("शिकण्याकडे परत जा"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
