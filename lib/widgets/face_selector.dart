import 'package:flutter/material.dart';

class FaceSelector extends StatelessWidget {
  final VoidCallback? onSelect;
  const FaceSelector({Key? key, this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelect ?? () {},
      child: const Text('Select Face (Gallery)'),
    );
  }
}