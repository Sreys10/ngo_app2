import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LovePage extends StatefulWidget {
  const LovePage({super.key});

  @override
  State<LovePage> createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/PD/videos/love.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the video is loaded before displaying
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("प्रेम"),
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
              // GIF Emoji Display
              Image.asset(
                'assets/PD/emojis/love.gif',
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),

              // Emotion Title
              const Text(
                'प्रेम',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Emotion Description
              const Text(
                'प्रेम ही एक गहिरा, मानसिक आणि शारीरिक भावना आहे जी आपण कोणाशी तरी संबंधित असताना अनुभवतो.',
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
                      'तुम्ही तुमच्या कुटुंबासोबत वेळ घालवत आहात आणि त्याच्याशी जवळीक अनुभवता, ज्यामुळे तुम्हाला प्रेमाची भावना अनुभवायला मिळते.',
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
                      'तुम्ही तुमच्या मित्राला मदत करत आहात, ज्यामुळे तुमच्यात प्रेम आणि एकमेकांच्या सहकार्याची भावना निर्माण होते.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Example Images of Human Faces
              const Text(
                'प्रेम व्यक्त करणाऱ्या मानवी चेहऱ्याचे उदाहरण:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),

              // Image 1
              Image.asset(
                'assets/PD/faces/love1.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),

              // Image 2
              Image.asset(
                'assets/PD/faces/love2.jpeg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
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
