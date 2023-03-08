// import 'package:flutter/material.dart';
// import 'package:the_masters/Models/Item.dart';
//
// class NewOrder extends StatefulWidget {
//   late Function(List<String?> items, List<double> prices, List<int> quantities)
//       placeOrder;
//
//   NewOrder(this.placeOrder);
//
//   @override
//   State<NewOrder> createState() => _NewOrderState();
// }
//
// class _NewOrderState extends State<NewOrder> {
//   List<String> items = [];
//
//   String? dropDownValue = 'Suit Complete';
//   List<String?> dropDownValues = [];
//   late double price;
//   List<double> prices = [];
//   late int quantity;
//   List<int> quantities = [];
//   int counter = 0;
//
//   List<Fields> fields = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     dropDownValues.add('Suit Complete');
//     prices.add(2500);
//     quantities.add(1);
//     fields.add(
//       Fields(
//         items: items,
//         dropDownValues: dropDownValues,
//         prices: prices,
//         quantities: quantities,
//         counter: counter,
//       ),
//     );
//     counter++;
//
//     for (Item item in ItemsHandler().items) {
//       items.add(item.name);
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Column(
//                   children: fields,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       dropDownValues.add('Suit Complete');
//                       prices.add(2500);
//                       quantities.add(1);
//                       fields.add(
//                         Fields(
//                           items: items,
//                           dropDownValues: dropDownValues,
//                           quantities: quantities,
//                           prices: prices,
//                           counter: counter,
//                         ),
//                       );
//                       counter++;
//                     });
//                   },
//                   icon: Icon(
//                     Icons.add,
//                     size: 24,
//                   ),
//                   label: Text('Add Item'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     widget.placeOrder(dropDownValues, prices, quantities);
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add Order'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Fields extends StatefulWidget {
//   List<String> items = [];
//   List<String?> dropDownValues = [];
//   List<double> prices = [];
//   List<int> quantities = [];
//   late int counter;
//
//   Fields(
//       {required this.items,
//       required this.dropDownValues,
//       required this.prices,
//       required this.quantities,
//       required this.counter});
//
//   @override
//   State<Fields> createState() => _FieldsState();
// }
//
// class _FieldsState extends State<Fields> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DropdownButton(
//           icon: const Icon(Icons.keyboard_arrow_down),
//           value: widget.dropDownValues[widget.counter],
//           items: widget.items.map((String items) {
//             return DropdownMenuItem(
//               value: items,
//               child: Text(items),
//             );
//           }).toList(),
//           onChanged: (String? value) {
//             setState(() {
//               widget.dropDownValues[widget.counter] = value;
//             });
//           },
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           onChanged: (value) {
//             widget.prices[widget.counter] = double.parse(value);
//           },
//           decoration: InputDecoration(
//             hintText: 'Enter Price',
//           ),
//         ),
//         TextField(
//           keyboardType: TextInputType.number,
//           onChanged: (value) {
//             widget.quantities[widget.counter] = int.parse(value);
//           },
//           decoration: const InputDecoration(
//             hintText: 'Enter Quantity',
//           ),
//         ),
//         const Divider(),
//       ],
//     );
//   }
// }
//
// // Column(
// // children: [
// // DropdownButton(
// // icon: const Icon(Icons.keyboard_arrow_down),
// // value: dropDownValue,
// // items: items.map((String items) {
// // return DropdownMenuItem(
// // value: items,
// // child: Text(items),
// // );
// // }).toList(),
// // onChanged: (String? value) {
// // setState(() {
// // dropDownValue = value;
// // });
// // },
// // ),
// // TextField(
// // keyboardType: TextInputType.number,
// // onChanged: (value) {
// // price = double.parse(value);
// // },
// // decoration: InputDecoration(
// // hintText: 'Enter Price',
// // ),
// // ),
// // TextField(
// // keyboardType: TextInputType.number,
// // onChanged: (value) {
// // quantity = int.parse(value);
// // },
// // decoration: InputDecoration(
// // hintText: 'Enter Quantity',
// // ),
// // ),
// // Divider(),
// // ],
// // ),
