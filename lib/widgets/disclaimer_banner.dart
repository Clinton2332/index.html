import 'package:flutter/material.dart';

class DisclaimerBanner extends StatelessWidget {
  const DisclaimerBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: const Text(
        'For entertainment only. All outputs are watermarked. Do not use to impersonate or mislead.',
        style: TextStyle(fontSize: 12, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }
}