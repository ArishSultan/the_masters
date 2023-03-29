import 'package:flutter/material.dart';
import 'package:the_masters/src/widgets/next_button.dart';
import 'package:the_masters/src/widgets/prev_button.dart';

class PricingStep extends StatefulWidget {
  const PricingStep({super.key, this.onBack, this.onDone});

  final VoidCallback? onBack;
  final VoidCallback? onDone;

  @override
  State<PricingStep> createState() => _PricingStepState();
}

class _PricingStepState extends State<PricingStep> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        decoration: InputDecoration(label: Text('Price')),
      ),
      TextFormField(
        decoration: InputDecoration(label: Text('Price')),
      ),
      Row(children: [
        const Spacer(),
        PrevButton(widget.onBack),
        const SizedBox(width: 10),
        TextButton.icon(
          icon: const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Place Order'),
          ),
          label: const Icon(Icons.done, size: 20),
          onPressed: widget.onDone,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
            disabledBackgroundColor: Colors.grey.shade300,
          ),
        )
      ])
    ]);
  }
}
