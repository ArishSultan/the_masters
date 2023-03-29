import 'package:flutter/material.dart';
import 'package:the_masters/src/widgets/next_button.dart';
import 'package:the_masters/src/widgets/prev_button.dart';

class OrderItemStep extends StatefulWidget {
  const OrderItemStep({super.key, this.onNext, this.onBack});

  final VoidCallback? onBack;
  final VoidCallback? onNext;

  @override
  State<OrderItemStep> createState() => _OrderItemStepState();
}

class _OrderItemStepState extends State<OrderItemStep> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        const Spacer(),
        PrevButton(widget.onBack),
        const SizedBox(width: 10),
        NextButton(widget.onNext),
      ])
    ]);
  }
}
