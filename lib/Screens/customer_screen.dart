import 'package:flutter/material.dart';
import 'package:the_masters/Components/new_order.dart';
import 'package:the_masters/Models/Item.dart';
import 'package:the_masters/Models/OrderItem.dart';
import 'package:the_masters/Models/customer.dart';

import '../Models/Order.dart';

class CustomerScreen extends StatefulWidget {
  final Customer customer;

  const CustomerScreen({Key? key, required this.customer}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  void completeOrder(OrderItem orderItem, String? dropValue) {
    setState(() {
      orderItem.completedQuantity += int.parse(dropValue!);
      orderItem.setQuantity(orderItem.quantity - int.parse(dropValue));
    });
  }

  void newOrder(
      List<String?> items, List<double> prices, List<int> quantities) {
    setState(() {
      Order order = widget.customer.addOrder();
      List<Item> addItems = [];
      for (int j = 0; j < items.length; j++) {
        for (Item i in ItemsHandler().items) {
          if (i.name == items[j]) addItems.add(i);
        }
        addItems[j].setPrice(prices[j]);
        order.addItem(addItems[j], quantities[j]);
      }
    });
  }

  List<DataRow> dataRow() {
    List<DataRow> dataRows = [];
    for (Order order in widget.customer.orders) {
      int id = order.id;
      bool idDone = false;
      for (OrderItem orderItem in order.items) {
        if (orderItem.completedQuantity < orderItem.orignalQuantity) {
          dataRows.add(
            DataRow(
              cells: [
                idDone
                    ? DataCell(Text(''))
                    : DataCell(Text(order.id.toString())),
                DataCell(Text(orderItem.item.name)),
                DataCell(Text(orderItem.quantity.toString())),
                DataCell(Text(orderItem.item.price.toString())),
                DataCell(Status(orderItem.quantity, orderItem, completeOrder)),
              ],
            ),
          );
          idDone = true;
        }
      }
    }
    return dataRows;
  }

  List<DataRow> getCompletedData() {
    List<DataRow> dataRows = [];
    for (Order order in widget.customer.orders) {
      int id = order.id;
      bool idDone = false;
      for (OrderItem orderItem in order.items) {
        if (orderItem.completedQuantity > 0) {
          dataRows.add(
            DataRow(
              cells: [
                idDone
                    ? DataCell(Text(''))
                    : DataCell(Text(order.id.toString())),
                DataCell(Text(orderItem.item.name)),
                DataCell(Text(orderItem.completedQuantity.toString())),
                DataCell(Text(orderItem.item.price.toString())),
                DataCell(TextButton(
                  child: Text('Completed'),
                  onPressed: () {},
                ))
              ],
            ),
          );
          idDone = true;
        }
      }
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The Masters'),
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.customer.customerNo.toString()),
                Text(widget.customer.name),
                Text(widget.customer.primaryPhone),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return NewOrder(newOrder);
                      },
                    );
                  },
                  child: Text('New Order'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Remaining Orders'),
                Text('Completed Orders'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DataTable(
                  columns: const [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Item')),
                    DataColumn(label: Text('Quantity'), numeric: true),
                    DataColumn(label: Text('Amount'), numeric: true),
                    DataColumn(label: Text('Status')),
                  ],
                  rows: dataRow(),
                ),
                DataTable(
                  columns: const [
                    DataColumn(label: Text('No')),
                    DataColumn(label: Text('Item')),
                    DataColumn(label: Text('Quantity'), numeric: true),
                    DataColumn(label: Text('Amount'), numeric: true),
                    DataColumn(label: Text('Status'))
                  ],
                  rows: getCompletedData(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Status extends StatefulWidget {
  String? dropValue = '1';
  List<String> values = [];
  OrderItem orderItem;
  Function completeOrder;

  Status(int quantity, this.orderItem, this.completeOrder, {Key? key})
      : super(key: key) {
    for (int i = 1; i <= quantity; i++) {
      values.add(i.toString());
    }
  }

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: widget.dropValue,
          items: widget.values.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              widget.dropValue = value;
            });
          },
        ),
        TextButton(
          child: Text('Completed'),
          onPressed: () {
            int prev = widget.orderItem.quantity;
            widget.completeOrder(widget.orderItem, widget.dropValue);
            for (int i = widget.orderItem.quantity + 1; i <= prev; i++) {
              widget.values.remove(i.toString());
            }
          },
        ),
      ],
    );
  }
}
