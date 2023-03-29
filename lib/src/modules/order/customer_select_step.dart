import 'package:flutter/material.dart';
import 'package:the_masters/src/modules/customer/customer.dart';
import 'package:the_masters/src/modules/customer/customer_select.dart';
import 'package:the_masters/src/widgets/next_button.dart';

class CustomerSelectStep extends StatefulWidget {
  const CustomerSelectStep({
    super.key,
    this.onNext,
    this.customer,
    this.onSelected,
  });

  final Customer? customer;
  final VoidCallback? onNext;
  final AutocompleteOnSelected<Customer>? onSelected;

  @override
  State<CustomerSelectStep> createState() => _CustomerSelectStepState();
}

class _CustomerSelectStepState extends State<CustomerSelectStep> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(children: [
        CustomerSelect(onSelected: widget.onSelected),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: OutlinedButton.icon(
              label: const Text('New Customer'),
              icon: const Icon(Icons.add_rounded),
              onPressed: () {},
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: NextButton(widget.customer == null ? null : widget.onNext),
        )
      ]),
    );
  }
}
