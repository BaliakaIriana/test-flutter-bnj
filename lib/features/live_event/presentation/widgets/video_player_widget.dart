import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_flutter_bnj/features/live_event/data/datasources/mock_socket_service.dart';
import 'package:test_flutter_bnj/injection.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? streamUrl;

  const VideoPlayerWidget({super.key, required this.streamUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    if (widget.streamUrl != null) {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.streamUrl!),
      );
      _controller.play();

      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.streamUrl == null) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Text(
            'No stream available',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Stack(
      children: [
        Chewie(controller: _chewieController),
        Positioned(
          top: 8,
          left: 8,
          child: Row(
            children: [
              Icon(Icons.live_tv, color: Colors.red, size: 16),
              Gap(4),
              Text(
                'Live',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // viewer count
        Positioned(
          top: 8,
          right: 8,
          child: StreamBuilder(
            stream: getIt<MockSocketService>().viewerCount,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting ||
                  asyncSnapshot.hasError ||
                  hasNoViewers(asyncSnapshot)) {
                return Container();
              }
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Row(
                  children: [
                    Icon(Icons.people, color: Colors.white, size: 16),
                    Gap(4),
                    Text(
                      '${asyncSnapshot.data} viewers',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  bool hasNoViewers(AsyncSnapshot<int> asyncSnapshot) {
    return !asyncSnapshot.hasData || (asyncSnapshot.data ?? 0) <= 0;
  }
}
