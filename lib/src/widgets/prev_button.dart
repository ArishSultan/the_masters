import 'package:flutter/material.dart';

class PrevButton extends StatelessWidget {
  const PrevButton(this.onPressed, {super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: const Text('Back'),
      icon: const Icon(Icons.arrow_back_rounded, size: 20),
      onPressed: onPressed,
    );
  }
}
