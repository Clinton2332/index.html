import 'package:flutter/material.dart';
import '../widgets/video_call_ui.dart';

class FakeCallScreen extends StatefulWidget {
  const FakeCallScreen({Key? key}) : super(key: key);

  @override
  State<FakeCallScreen> createState() => _FakeCallScreenState();
}

class _FakeCallScreenState extends State<FakeCallScreen> {
  // TODO: Store selected caller, video, and recording state
  // String? _callerName;
  // File? _callerFace;
  // File? _videoFile;

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
                  onPressed: () {
                    // TODO: Select caller (face/name)
                  },
                  child: const Text('Select Caller'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Pick or record video
                  },
                  child: const Text('Pick Video'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: VideoCallUI(
                  // TODO: Pass caller and video info
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Record/share the fake call
              },
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