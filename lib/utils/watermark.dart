import 'dart:io';
import 'package:image/image.dart' as img;

class WatermarkUtil {
  static Future<File> addWatermarkToImage(File file) async {
    final bytes = await file.readAsBytes();
    img.Image? image = img.decodeImage(bytes);
    if (image == null) return file;
    // Draw watermark text
    img.drawString(
      image,
      img.arial_24,
      image.width - 260,
      image.height - 40,
      'FaceSwapPrank',
      color: img.getColor(255, 255, 255, 180),
    );
    final tempDir = Directory.systemTemp;
    final outFile = File('${tempDir.path}/watermarked_${DateTime.now().millisecondsSinceEpoch}.png');
    await outFile.writeAsBytes(img.encodePng(image));
    return outFile;
  }

  static Future<void> addWatermarkToVideo(/* video, watermark */) async {
    // Use ffmpeg or similar (not implemented)
  }
}