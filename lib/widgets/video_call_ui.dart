import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoCallUI extends StatelessWidget {
  final String? callerName;
  final Widget? callerFace;
  final VideoPlayerController? videoController;

  const VideoCallUI({Key? key, this.callerName, this.callerFace, this.videoController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.grey[300],
            child: callerFace ?? const Icon(Icons.person, size: 40, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Text(
            callerName ?? 'Caller Name',
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: videoController != null && videoController!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: videoController!.value.aspectRatio,
                      child: VideoPlayer(videoController!),
                    )
                  : const Center(
                      child: Icon(Icons.videocam, color: Colors.white54, size: 48),
                    ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}