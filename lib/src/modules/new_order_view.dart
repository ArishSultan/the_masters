import 'package:flutter/material.dart';
import 'package:the_masters/src/app.dart';
import 'package:the_masters/src/modules/order/customer_select.dart';

class NewOrderView extends StatefulWidget {
  const NewOrderView({Key? key}) : super(key: key);

  @override
  State<NewOrderView> createState() => _NewOrderViewState();
}

class _NewOrderViewState extends State<NewOrderView> {
  var currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Order'),
      ),
      body: Stepper(
        elevation: 0,
        currentStep: currentStep,
        steps: [
          Step(
            title: Text('Customer Information'),
            content: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomerSelect(),
            ),
          ),
          Step(title: Text('Step 2'), content: Text('Step 2 - Content')),
          Step(title: Text('Step 3'), content: Text('Step 3 - Content')),
        ],
        controlsBuilder: (context, details) {
          if (details.isActive) {
            return SizedBox();
          }

          if (details.currentStep == 0) {
            return SizedBox();
          }

          return SizedBox();
        },
      ),
    );
  }
}
