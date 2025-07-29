import 'dart:io';
import 'package:flutter/material.dart';

class GalleryService extends ChangeNotifier {
  final List<File> _faceImages = [];

  List<File> get faceImages => _faceImages;

  void addFaceImage(File file) {
    _faceImages.add(file);
    notifyListeners();
  }

  // TODO: Add import from contacts/social
}