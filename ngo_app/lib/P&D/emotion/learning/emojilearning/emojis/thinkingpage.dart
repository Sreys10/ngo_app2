// lib/thinking_page.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ThinkingPage extends StatefulWidget {
  const ThinkingPage({super.key});

  @override
  State<ThinkingPage> createState() => _ThinkingPageState();
}

class _ThinkingPageState extends State<ThinkingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/PD/videos/thinking.mp4')
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
        title: const Text("विचार"),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GIF Emoji Display from Assets
              Image.asset(
                'assets/PD/emojis/thinking.gif',
                height: 120, // Increased height for emoji
                width: 120, // Increased width for emoji
              ),
              const SizedBox(height: 20),

              // Emotion Title
              const Text(
                'विचार',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Emotion Description
              const Text(
                'विचार करत आहे हे म्हणजे आपला मेंदू एखाद्या गोष्टीवर गहन विचार करत आहे. हे विचारांमध्ये गोंधळ, शंका, किंवा विचारांची तपासणी असू शकते.',
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
                      'एक विद्यार्थी विचार करत आहे ज्या क्षणी त्याला परीक्षा विषयावर अधिक माहिती मिळवायची आहे.',
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
                      'तुम्ही तुमच्या करिअरच्या भविष्यासाठी निर्णय घेण्याचा विचार करत असाल.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Example Images of Human Faces
              const Text(
                'विचार दर्शवणाऱ्या मानवी चेहऱ्यांचे उदाहरण:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),

              // Image 1
              Image.asset(
                'assets/PD/faces/thinking1.jpg',
                height: 250, // Increased height for image
                width: double.infinity,
                fit: BoxFit.contain, // Ensuring the image is not cropped
              ),
              const SizedBox(height: 10),

              // Image 2
              Image.asset(
                'assets/PD/faces/thinking2.jpg',
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
