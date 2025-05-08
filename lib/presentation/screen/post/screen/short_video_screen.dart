import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShortVideoScreen extends StatefulWidget {
    const ShortVideoScreen({super.key});

    @override
    _ShortVideoScreenState createState() => _ShortVideoScreenState();
}

class _ShortVideoScreenState extends State<ShortVideoScreen> {
    final List<String> videoUrls = [
        'assets/short_videos/sort_video_1.mp4',
        'assets/short_videos/sort_video_1.mp4',
        'assets/short_videos/sort_video_1.mp4',
        'assets/short_videos/sort_video_1.mp4',
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videoUrls.length,
                itemBuilder: (context, index) {
                    return ShortVideoPlayer(videoUrl: videoUrls[index]);
                },
            ),
        );
    }
}

class ShortVideoPlayer extends StatefulWidget {
    final String videoUrl;

    const ShortVideoPlayer({required this.videoUrl, super.key});

    @override
    _ShortVideoPlayerState createState() => _ShortVideoPlayerState();
}

class _ShortVideoPlayerState extends State<ShortVideoPlayer> {
    late VideoPlayerController _controller;

    @override
    void initState() {
        super.initState();
        _controller = VideoPlayerController.asset(widget.videoUrl)
            ..initialize().then((_) {
                setState(() {});
                _controller.play();
                _controller.setLooping(true);
            });
    }

    @override
    void dispose() {
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const Center(child: CircularProgressIndicator());
    }
}