import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    home: VirtualFieldPage(),
  ));
}

class VirtualFieldPage extends StatelessWidget {
  const VirtualFieldPage({super.key});

  final List<Map<String, String>> _videos = const [
    {
      'title': 'हवामान बदल समजून घेणे',
      'path': 'assets/ENVIRONMENT/videos/climate_change.mp4',
    },
    {
      'title': 'पाणी संवर्धन तंत्रे',
      'path': 'assets/ENVIRONMENT/videos/water_conservation.mp4',
    },
    {
      'title': 'कचरा व्यवस्थापन धोरणे',
      'path': 'assets/ENVIRONMENT/videos/waste_management.mp4',
    },
    {
      'title': 'जैवविविधता संरक्षण',
      'path': 'assets/ENVIRONMENT/videos/biodiversity.mp4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('व्हर्च्युअल फील्ड'),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _videos.map((video) {
          return _buildVideoCard(
            context,
            title: video['title']!,
            assetPath: video['path']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context,
      {required String title, required String assetPath}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.play_arrow),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerPage(
                title: title,
                assetPath: assetPath,
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String title;
  final String assetPath;

  const VideoPlayerPage({
    super.key,
    required this.title,
    required this.assetPath,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFF2E7D32),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_controller),
                    _ControlsOverlay(controller: _controller),
                  ],
                ),
              )
            : Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const _ControlsOverlay({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: 70.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
        ),
      ],
    );
  }
}
