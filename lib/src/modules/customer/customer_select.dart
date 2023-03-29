import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:the_masters/src/modules/customer/customer.dart';
import 'package:the_masters/src/modules/customer/customer_service.dart';
import 'package:the_masters/src/widgets/order_chip.dart';

class CustomerSelect extends StatefulWidget {
  const CustomerSelect({super.key, this.onSelected});

  final AutocompleteOnSelected<Customer>? onSelected;

  @override
  State<CustomerSelect> createState() => _CustomerSelectState();
}

class _CustomerSelectState extends State<CustomerSelect> {
  var isLoading = false;

  final service = CustomerService();

  final focusNode = FocusNode();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget? loading;
    if (isLoading) {
      loading = ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 10, maxWidth: 10),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Column(children: [
      LayoutBuilder(builder: (context, constraints) {
        return RawAutocomplete<Customer>(
          focusNode: focusNode,
          onSelected: widget.onSelected,
          textEditingController: controller,
          displayStringForOption: (option) => option.name,
          optionsBuilder: (value) => service.fetch(value.text),
          optionsViewBuilder: (context, onSelected, options) {
            return _CustomerSelectOptions(
              options: options,
              controller: controller,
              onSelected: onSelected,
              width: constraints.maxWidth,
            );
          },
          fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
            return TextFormField(
              focusNode: focusNode,
              controller: controller,
              onFieldSubmitted: (_) => onFieldSubmitted(),
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: loading,
                labelText: 'Search Customer',
              ),
            );
          },
        );
      })
    ]);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();

    super.dispose();
  }
}

// The default Material-style Autocomplete options.
class _CustomerSelectOptions extends StatelessWidget {
  const _CustomerSelectOptions({
    required this.width,
    required this.options,
    required this.controller,
    required this.onSelected,
  });

  final double width;
  final Iterable<Customer> options;
  final TextEditingController controller;
  final AutocompleteOnSelected<Customer> onSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4.0,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300, maxWidth: width),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              return _CustomerSelectOption(
                index: index,
                onSelected: onSelected,
                controller: controller,
                customer: options.elementAt(index),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CustomerSelectOption extends StatelessWidget {
  const _CustomerSelectOption({
    required this.index,
    required this.customer,
    required this.controller,
    required this.onSelected,
  });

  final int index;
  final Customer customer;
  final TextEditingController controller;
  final AutocompleteOnSelected<Customer> onSelected;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      final highlight = AutocompleteHighlightedOption.of(context) == index;
      if (highlight) {
        SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
          Scrollable.ensureVisible(context, alignment: 0.5);
        });
      }

      String phonesText = customer.phones.map((e) => '• $e').join('\n');

      Widget name;
      if (CustomerService.nameRegExp.hasMatch(controller.text)) {
        final theme = Theme.of(context);

        name = _makeRichTextFromMatches(
          customer.name,
          controller.text,
          theme.textTheme.bodyLarge!,
        );
      } else {
        name = Text(customer.name);
      }

      Widget order;
      if (CustomerService.orderRegExp.hasMatch(controller.text)) {
        order = OrderChip(
          child: _makeRichTextFromMatches(
            customer.order,
            controller.text,
            const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        );
      } else {
        order = OrderChip(text: customer.order);
      }

      Widget phone;
      if (controller.text.isNotEmpty && controller.text[0] == '0') {
        final theme = Theme.of(context);
        phone = _makeRichTextFromMatches(
          phonesText,
          controller.text,
          theme.textTheme.bodyMedium!,
          Colors.grey.shade600,
        );
      } else {
        phone = Text(phonesText);
      }

      return Container(
        color: highlight ? Theme.of(context).focusColor : null,
        child: ListTile(
          title: name,
          trailing: order,
          subtitle: phone,
          onTap: () => onSelected(customer),
        ),
      );
    });
  }

  Widget _makeRichTextFromMatches(
    String text,
    String query, [
    TextStyle defaultStyle = const TextStyle(),
    Color? textColor,
  ]) {
    final matches = RegExp(query).allMatches(text);

    if (matches.isEmpty) return Text(text);
    final textSpans = <TextSpan>[];

    var last = 0;
    for (final match in matches) {
      var normalString = text.substring(last, match.start);
      if (normalString.isNotEmpty) {
        textSpans.add(TextSpan(text: normalString));
      }

      var highlightedString = text.substring(match.start, match.end);
      if (highlightedString.isNotEmpty) {
        textSpans.add(TextSpan(
          text: highlightedString,
          style: const TextStyle(backgroundColor: Colors.yellow),
        ));
      }

      last = match.end;
    }

    var normalString = text.substring(last, text.length);
    if (normalString.isNotEmpty) {
      textSpans.add(TextSpan(text: normalString));
    }

    return RichText(
      text: TextSpan(
        children: textSpans,
        style: defaultStyle.copyWith(color: textColor ?? Colors.black),
      ),
    );
  }
}
