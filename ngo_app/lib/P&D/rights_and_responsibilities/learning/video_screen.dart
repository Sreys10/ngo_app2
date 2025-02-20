import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final String language;

  const VideoScreen({super.key, required this.language});

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    String videoPath;
    switch (widget.language) {
      case 'marathi':
        videoPath =
            'assets/PD/videos_rights_and_responsibilites/marathi_video.mp4'; // Replace with actual video path
        break;
      case 'english':
        videoPath =
            'assets/PD/videos_rights_and_responsibilites/english_video.mp4'; // Replace with actual video path
        break;
      case 'hindi':
        videoPath =
            'assets/PD/videos_rights_and_responsibilites/marathi_video.mp4'; // Replace with actual video path
        break;
      default:
        videoPath =
            'assets/PD/videos_rights_and_responsibilites/marathi_video.mp4'; // Replace with actual video path
    }
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.language == 'marathi'
              ? 'व्हिडिओ'
              : widget.language == 'hindi'
                  ? 'वीडियो'
                  : 'Video',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(150, 221, 59, 59),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(_controller),
                          if (!_controller.value.isPlaying)
                            Icon(
                              Icons.play_circle_filled,
                              size: 64,
                              color:
                                  Colors.white.withAlpha((0.7 * 255).toInt()),
                            ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(
                      color: const Color.fromARGB(150, 221, 59, 59),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.seekTo(Duration.zero);
                    });
                  },
                  icon: Icon(
                    Icons.replay,
                    size: 32,
                    color: const Color.fromARGB(150, 221, 59, 59),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  backgroundColor: const Color.fromARGB(150, 221, 59, 59),
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.seekTo(_controller.value.duration);
                    });
                  },
                  icon: Icon(
                    Icons.forward,
                    size: 32,
                    color: const Color.fromARGB(150, 221, 59, 59),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.language == 'marathi'
                  ? 'व्हिडिओ पाहण्यासाठी आनंद घ्या!'
                  : widget.language == 'hindi'
                      ? 'वीडियो देखने का आनंद लें!'
                      : 'Enjoy watching the video!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(150, 221, 59, 59),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
