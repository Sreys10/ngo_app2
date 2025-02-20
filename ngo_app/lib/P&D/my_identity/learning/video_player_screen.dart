import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.title, required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Use asset method for local video
    _controller = VideoPlayerController.asset(widget.videoUrl); // Use local video path
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true); // Set the video to loop
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Display the title of the video
        backgroundColor: const Color.fromARGB(255, 247, 174, 78), // Pastel pink app bar
      ),
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 174, 78), // Pastel pink button color
                    ),
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                      color: Colors.white, // White icon for contrast
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
