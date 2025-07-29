import 'package:flutter/material.dart';

class GalleryService extends ChangeNotifier {
  // For now, use a list of placeholder widgets. Replace with images/files in real app.
  final List<Widget> _faces = [
    const Icon(Icons.person, size: 64),
    const Icon(Icons.person_outline, size: 64),
    const Icon(Icons.face, size: 64),
  ]; // TODO: Load from assets

  List<Widget> get faces => _faces;

  void addFace(Widget face) {
    _faces.add(face);
    notifyListeners();
  }

  // TODO: Add upload/import logic
}