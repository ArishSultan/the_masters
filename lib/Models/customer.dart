import 'package:the_masters/Models/CustomerHandler.dart';

import 'Order.dart';

class Customer {
  late final int _customerNo;
  final String _name;
  final String _primaryPhone;

  List<Order> orders = [];

  Customer(this._name, this._primaryPhone, this._customerNo);

  Order addOrder() {
    Order order = Order(orders.length + 1);
    orders.add(order);
    return order;
  }

  String get primaryPhone => _primaryPhone;

  String get name => _name;

  int get customerNo => _customerNo;

  set setCustomerNo(customerNo) => _customerNo = customerNo;
}
