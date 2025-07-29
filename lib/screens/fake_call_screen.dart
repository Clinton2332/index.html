import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../widgets/video_call_ui.dart';
import '../services/media_service.dart';
import '../services/gallery_service.dart';

class FakeCallScreen extends StatefulWidget {
  const FakeCallScreen({Key? key}) : super(key: key);

  @override
  State<FakeCallScreen> createState() => _FakeCallScreenState();
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  String? _callerName;
  Widget? _callerFace;
  File? _videoFile;
  VideoPlayerController? _controller;
  final MediaService _mediaService = MediaService();

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _selectCaller(BuildContext context) async {
    final gallery = Provider.of<GalleryService>(context, listen: false);
    if (gallery.faces.isNotEmpty) {
      setState(() {
        _callerFace = gallery.faces.first;
        _callerName = 'Celebrity';
      });
    }
  }

  Future<void> _pickVideo() async {
    final file = await _mediaService.pickVideo();
    if (file != null) {
      _controller?.dispose();
      _controller = VideoPlayerController.file(file);
      await _controller!.initialize();
      setState(() {
        _videoFile = file;
      });
      _controller!.play();
    }
  }

  Future<void> _recordOrShare() async {
    if (_videoFile != null) {
      await _mediaService.shareMedia(_videoFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fake Video Call')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _selectCaller(context),
                  child: const Text('Select Caller'),
                ),
                ElevatedButton(
                  onPressed: _pickVideo,
                  child: const Text('Pick Video'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: VideoCallUI(
                  callerName: _callerName,
                  callerFace: _callerFace,
                  videoController: _controller,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _recordOrShare,
              child: const Text('Record/Share'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Simulated call for pranks. All outputs are watermarked.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}