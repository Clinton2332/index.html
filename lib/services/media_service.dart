import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class MediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickPhoto() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      return File(picked.path);
    }
    return null;
  }

  Future<File?> pickVideo() async {
    final picked = await _picker.pickVideo(source: ImageSource.gallery);
    if (picked != null) {
      return File(picked.path);
    }
    return null;
  }

  Future<void> shareMedia(File file) async {
    await Share.shareFiles([file.path]);
  }

  // TODO: Implement capturePhoto, recordVideo
}