import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DIYVideosPage extends StatefulWidget {
  const DIYVideosPage({super.key});

  @override
  _DIYVideosPageState createState() => _DIYVideosPageState();
}

class _DIYVideosPageState extends State<DIYVideosPage> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset(
        'assets/ENVIRONMENT/videos/unused_clothes.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller2 = VideoPlayerController.asset(
        'assets/ENVIRONMENT/videos/unused_plastics.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller3 = VideoPlayerController.asset(
        'assets/ENVIRONMENT/videos/old_glass_jars.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controller4 = VideoPlayerController.asset(
        'assets/ENVIRONMENT/videos/cardboard_boxes.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIY Video Suggestions'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildVideoCard(context, 'Unused Clothes',
                  'What can you do with old clothes?', _controller1),
              _buildVideoCard(context, 'Unused Plastics',
                  'Creative ways to reuse plastic bottles', _controller2),
              _buildVideoCard(context, 'Old Glass Jars',
                  'Transform jars into beautiful organizers', _controller3),
              _buildVideoCard(context, 'Cardboard Boxes',
                  'DIY projects using cardboard', _controller4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideoCard(
    BuildContext context,
    String title,
    String description,
    VideoPlayerController controller,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium), // Updated to headlineMedium
                const SizedBox(height: 8),
                Text(description,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium), // Updated to titleMedium
              ],
            ),
          ),
          if (controller.value.isInitialized)
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
