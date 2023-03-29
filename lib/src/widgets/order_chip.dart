import 'package:flutter/material.dart';

class OrderChip extends StatelessWidget {
  const OrderChip({super.key, this.text, this.child})
      : assert(text != null || child != null),
        assert(text == null || child == null);

  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final primaryColorLight = Theme.of(context).primaryColorLight;

    Widget textChild;
    if (child != null) {
      textChild = child!;
    } else {
      textChild = Text(
        text!,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: primaryColorLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: textChild,
    );
  }
}
