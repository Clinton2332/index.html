import 'package:flutter/material.dart';

class WatermarkOverlay extends StatelessWidget {
  const WatermarkOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: Opacity(
        opacity: 0.7,
        child: Container(
          color: Colors.black45,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: const Text(
            'FaceSwapPrank • Entertainment Only',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }
}