import 'package:flutter/material.dart';
import '../widgets/disclaimer_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Swap Prank')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/face-swap'),
            child: const Text('Face Swap Tool'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/fake-call'),
            child: const Text('Fake Video Call'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/gallery'),
            child: const Text('Face Gallery'),
          ),
          const Spacer(),
          const DisclaimerBanner(),
        ],
      ),
    );
  }
}