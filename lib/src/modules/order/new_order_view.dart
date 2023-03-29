import 'package:flutter/material.dart';
import 'package:the_masters/src/modules/customer/customer.dart';
import 'package:the_masters/src/modules/order/customer_select_step.dart';
import 'package:the_masters/src/modules/order/order_item_step.dart';
import 'package:the_masters/src/modules/order/pricing_step.dart';

class NewOrderView extends StatefulWidget {
  const NewOrderView({Key? key}) : super(key: key);

  @override
  State<NewOrderView> createState() => _NewOrderViewState();
}

class _NewOrderViewState extends State<NewOrderView> {
  var step = 0;
  Customer? customer;

  @override
  Widget build(BuildContext context) {
    // Step-1 Configurations;
    final step1Active = step == 0;
    final step1State = step > 0 ? StepState.complete : StepState.indexed;
    final step1Title = const Text('Customer Information');

    // Step-2 Configurations;
    final step2Active = step == 1;
    final step2State = step > 1 ? StepState.complete : StepState.indexed;
    const step2Title = Text('Order Items');

    // Step-3 Configurations;
    final step3Active = step == 2;
    const step3Title = Text('Pricing');

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Order'),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.close_rounded),
        ),
      ),
      body: Stepper(
        currentStep: step,
        controlsBuilder: (_, __) => const SizedBox(),
        steps: [
          Step(
            title: step1Title,
            state: step1State,
            isActive: step1Active,
            content: CustomerSelectStep(
              onNext: nextStep,
              customer: customer,
              onSelected: onCustomerSelected,
            ),
          ),
          //
          Step(
            title: step2Title,
            state: step2State,
            isActive: step2Active,
            content: OrderItemStep(
              onNext: nextStep,
              onBack: previousStep,
            ),
          ),
          Step(
            title: step3Title,
            isActive: step3Active,
            content: PricingStep(
              onBack: previousStep,
              onDone: nextStep,
            ),
          ),
        ],
      ),
    );
  }

  void nextStep() => setState(() => ++step);
  void setStep(int value) => setState(() => step = value);

  void previousStep() => setState(() => --step);

  void onCustomerSelected(value) => setState(() => customer = value);
}
