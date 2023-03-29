import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton(this.onPressed, {super.key});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        icon: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text('Next'),
        ),
        label: const Icon(Icons.arrow_forward_rounded, size: 20),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          disabledBackgroundColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}
