import 'package:flutter/material.dart';
import '../widgets/face_selector.dart';
import '../widgets/watermark_overlay.dart';

class FaceSwapScreen extends StatefulWidget {
  const FaceSwapScreen({Key? key}) : super(key: key);

  @override
  State<FaceSwapScreen> createState() => _FaceSwapScreenState();
}

class _FaceSwapScreenState extends State<FaceSwapScreen> {
  // TODO: Store selected image, selected face, and swapped result
  // File? _inputImage;
  // File? _selectedFace;
  // File? _swappedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Swap Tool')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Pick or capture photo
                  },
                  child: const Text('Upload/Capture Photo'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Select face from gallery
                  },
                  child: const Text('Select Face'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // TODO: Show input or swapped image
                    Container(
                      width: 240,
                      height: 320,
                      color: Colors.grey[300],
                      child: const Center(child: Text('Preview Area')),
                    ),
                    const WatermarkOverlay(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Save or share swapped image
              },
              child: const Text('Save/Share'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Face swap uses on-device AI (MediaPipe/OpenCV).',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}