import 'package:flutter/material.dart';
import 'package:play_video/play_video.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PlayVideoRender.init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayVideoScreen(),
    ),
  );
}

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({super.key});

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late PlayVideoController controller;

  @override
  void initState() {
    controller = PlayVideoController(
      isAutoPlay: true,
      videos: Videos.multiVideoWithSingleType(
        videos: [
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
        ],
        type: VideoType.network,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlayVideo(
        controller: controller,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
      ),
    );
  }
}
