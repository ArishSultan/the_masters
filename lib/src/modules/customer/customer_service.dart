import 'dart:async';
import 'customer.dart';

///
abstract class CustomerService {
  static final nameRegExp = RegExp('a-zA-Z');
  static final orderRegExp = RegExp('1-9');

  ///
  FutureOr<void> create(Customer customer);

  ///
  FutureOr<void> delete(Customer customer);

  ///
  FutureOr<List<Customer>> fetch([String? query]);

  ///
  FutureOr<void> update(Customer customer);
}

// NOTE: Might be removed in future since, it is only used for development
// purposes.
class _MockCustomerService extends CustomerService {
  final _data = <Customer>[
    const Customer(
      order: '18',
      name: 'name',
      phones: ['03345213857'],
    ),
    const Customer(
      order: '61',
      name: 'Saad Tanzeel Qazi',
      phones: ['03369965003', '03351967099'],
    ),
    const Customer(
      order: '65',
      name: 'Qazi Ehtesham',
      phones: ['03335056097'],
    ),
    const Customer(
      order: '87',
      name: 'Khadim Hussain',
      phones: ['03215155641'],
    ),
    const Customer(
      order: '185',
      name: 'Faisal',
      phones: ['03005355424'],
    ),
    const Customer(
      order: '231',
      name: 'Muhammad Awais',
      phones: ['03005192131'],
    )
  ];

  @override
  void create(Customer customer) => _data.add(customer);

  @override
  void delete(Customer customer) =>
      _data.removeWhere((element) => customer.order == element.order);

  @override
  List<Customer> fetch([String? query]) {
    if (query == null || query.isEmpty) {
      return _data;
    }

    if (query[0] == '0') {
      return _data
          .where((e) => e.phones.any((e) => e.startsWith(query)))
          .toList();
    } else if (query.startsWith(CustomerService.nameRegExp)) {
      return _data.where((e) => e.name.contains(query)).toList();
    } else if (query.startsWith(CustomerService.orderRegExp)) {
      return _data.where((e) => e.order.contains(query)).toList();
    } else {
      return _data;
    }
  }

  @override
  void update(Customer customer) {
    final index = _data.indexWhere((e) => e.order == customer.order);
    if (index != -1) _data[index] = customer;
  }
}
