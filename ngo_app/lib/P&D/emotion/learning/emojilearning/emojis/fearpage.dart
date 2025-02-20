import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FearPage extends StatefulWidget {
  const FearPage({super.key});

  @override
  State<FearPage> createState() => _FearPageState();
}

class _FearPageState extends State<FearPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the video file
    _controller = VideoPlayerController.asset('assets/PD/videos/fear.mp4')
      ..initialize().then((_) {
        setState(() {}); // Refresh the widget once the video is loaded
      });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("भीती"),
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
                'assets/PD/emojis/fear.gif',
                height: 120, // Increased height for emoji
                width: 120, // Increased width for emoji
              ),
              const SizedBox(height: 20),

              // Emotion Title
              const Text(
                'भीती',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Emotion Description
              const Text(
                'भीती म्हणजे अशा भावना जेव्हा आपल्याला धोका किंवा संकट भासतो. ही भावना बचावासाठी प्रतिक्रिया असू शकते.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Video Player
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
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Text(
                  _controller.value.isPlaying ? 'Pause Video' : 'Play Video',
                ),
              ),
              const SizedBox(height: 30),

              // Example Images of Human Faces
              const Text(
                'भीती दर्शवणाऱ्या मानवी चेहऱ्यांचे उदाहरण:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),

              // Image 1
              Image.asset(
                'assets/PD/faces/fear1.jpg',
                height: 250, // Increased height for image
                width: double.infinity,
                fit: BoxFit.contain, // Ensuring the image is not cropped
              ),
              const SizedBox(height: 10),

              // Image 2
              Image.asset(
                'assets/PD/faces/fear2.jpg',
                height: 250, // Increased height for image
                width: double.infinity,
                fit: BoxFit.contain, // Ensuring the image is not cropped
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
                      'एक मुलगा भीती दाखवतो जेव्हा तो अंधारात एकटा चालतो.',
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
                      'एक मुलगी भीती अनुभवते जेव्हा तिला जंगलात गडबड किंवा आवाज ऐकायला येतो.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Back Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
