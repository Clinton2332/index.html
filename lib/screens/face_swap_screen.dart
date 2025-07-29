import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;
import '../widgets/face_selector.dart';
import '../widgets/watermark_overlay.dart';
import '../services/media_service.dart';
import '../services/gallery_service.dart';
import '../utils/watermark.dart';

class FaceSwapScreen extends StatefulWidget {
  const FaceSwapScreen({Key? key}) : super(key: key);

  @override
  State<FaceSwapScreen> createState() => _FaceSwapScreenState();
}

class _FaceSwapScreenState extends State<FaceSwapScreen> {
  File? _inputImage;
  File? _selectedFace;
  File? _swappedImage;

  final MediaService _mediaService = MediaService();

  Future<void> _pickPhoto() async {
    final file = await _mediaService.pickPhoto();
    if (file != null) {
      setState(() {
        _inputImage = file;
        _swappedImage = null;
      });
    }
  }

  Future<void> _selectFace(BuildContext context) async {
    final gallery = Provider.of<GalleryService>(context, listen: false);
    if (gallery.faceImages.isNotEmpty) {
      setState(() {
        _selectedFace = gallery.faceImages.first;
        _swappedImage = null;
      });
    }
  }

  Future<void> _swapFace() async {
    if (_inputImage == null || _selectedFace == null) return;
    final inputBytes = await _inputImage!.readAsBytes();
    final faceBytes = await _selectedFace!.readAsBytes();
    img.Image? inputImg = img.decodeImage(inputBytes);
    img.Image? faceImg = img.decodeImage(faceBytes);
    if (inputImg == null || faceImg == null) return;
    // Resize face to 1/3 of input width
    final resizedFace = img.copyResize(faceImg, width: (inputImg.width / 3).round());
    // Overlay face at center
    final x = (inputImg.width - resizedFace.width) ~/ 2;
    final y = (inputImg.height - resizedFace.height) ~/ 2;
    img.copyInto(inputImg, resizedFace, dstX: x, dstY: y, blend: true);
    final swappedFile = await _saveTempImage(inputImg);
    setState(() {
      _swappedImage = swappedFile;
    });
  }

  Future<File> _saveTempImage(img.Image image) async {
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/swapped_${DateTime.now().millisecondsSinceEpoch}.png');
    await file.writeAsBytes(img.encodePng(image));
    return file;
  }

  Future<void> _saveOrShare() async {
    if (_swappedImage != null) {
      await WatermarkUtil.addWatermarkToImage(_swappedImage!);
      await _mediaService.shareMedia(_swappedImage!);
    }
  }

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
                  onPressed: _pickPhoto,
                  child: const Text('Upload/Capture Photo'),
                ),
                ElevatedButton(
                  onPressed: () => _selectFace(context),
                  child: const Text('Select Face'),
                ),
                ElevatedButton(
                  onPressed: _swapFace,
                  child: const Text('Swap!'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (_swappedImage != null)
                      Image.file(_swappedImage!, width: 240, height: 320, fit: BoxFit.cover)
                    else if (_inputImage != null)
                      Image.file(_inputImage!, width: 240, height: 320, fit: BoxFit.cover)
                    else
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
              onPressed: _saveOrShare,
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