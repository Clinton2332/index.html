import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/gallery_service.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gallery = Provider.of<GalleryService>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Face Gallery')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Upload new face
                  },
                  child: const Text('Upload Face'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Import from contacts/social
                  },
                  child: const Text('Import from Contacts/Social'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: gallery.faces.length,
              itemBuilder: (context, index) {
                final face = gallery.faces[index];
                return GestureDetector(
                  onTap: () {
                    // TODO: Select face for swap
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: face,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}