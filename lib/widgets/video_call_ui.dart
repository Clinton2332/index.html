import 'package:flutter/material.dart';

class VideoCallUI extends StatelessWidget {
  // final String? callerName;
  // final File? callerFace;
  // final File? videoFile;
  // Add these as parameters when integrating

  const VideoCallUI({Key? key}) : super(key: key);

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
            // backgroundImage: callerFace != null ? FileImage(callerFace!) : null,
            child: const Icon(Icons.person, size: 40, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          const Text(
            'Caller Name', // Replace with callerName
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.videocam, color: Colors.white54, size: 48),
              ),
              // TODO: Show video playback here
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}