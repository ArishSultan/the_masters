import 'package:flutter/material.dart';

class CustomerSelect extends StatefulWidget {
  const CustomerSelect({Key? key}) : super(key: key);

  @override
  State<CustomerSelect> createState() => _CustomerSelectState();
}

class _CustomerSelectState extends State<CustomerSelect> {
  var isLoading = false;

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
      Autocomplete<String>(
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
        optionsBuilder: (value) async {
          if (value.text.isNotEmpty) {
            return ['false', 'true'];
          }

          return [];
        },
      )
    ]);
  }
}
