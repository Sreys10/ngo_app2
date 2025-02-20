import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GuiltPage extends StatefulWidget {
  const GuiltPage({super.key});

  @override
  State<GuiltPage> createState() => _GuiltPageState();
}

class _GuiltPageState extends State<GuiltPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/PD/videos/guilt.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the video is loaded before displaying it
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
        title: const Text("पश्चात्ताप"),
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
                'assets/PD/emojis/guilt.gif',
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),

              // Emotion Title
              const Text(
                'पश्चात्ताप',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Emotion Description
              const Text(
                'खेद म्हणजे आपल्याला एखाद्या गोष्टीचे वाईट वाटणे किंवा काही चुकीचे केल्याचे दु:ख. ते एक नैतिक भावना आहे जी आपल्याला बदलण्याची प्रेरणा देऊ शकते.',
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
                      'तुम्ही खेद व्यक्त करता जेव्हा तुम्ही तुमच्या मित्राचे मन दुखावले आणि त्यासाठी तुम्ही माफी मागता.',
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
                      'तुम्ही खेद व्यक्त करता जेव्हा तुम्ही आपल्या कुटुंबासाठी एखादी गोष्ट केली आणि नंतर तुम्हाला ते चुकीचे वाटते.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Example Images of Human Faces
              const Text(
                'पश्चात्ताप व्यक्त करणाऱ्या मानवी चेहऱ्यांचे उदाहरण:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 20),

              // Image 1
              Image.asset(
                'assets/PD/faces/guilt1.jpeg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),

              // Image 2
              Image.asset(
                'assets/PD/faces/guilt2.jpeg',
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
