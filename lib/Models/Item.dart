class Item {
  String _name;
  late double _price;

  Item(this._name);

  get name => _name;
  get price => _price;

  set setName(String name) => _name = name;

  void setPrice(double price) {
    _price = price;
  }
}

class ItemsHandler {
  final List<Item> items = [
    Item(
      'Suit Complete',
    ),
    Item(
      'Suit Stiching',
    ),
    Item(
      ' Pant (Complete)',
    ),
    Item(
      ' Pant (Stiching)',
    ),
    Item(
      'Shirt Complete',
    ),
    Item(
      'Shirt Stiching',
    ),
    Item(
      'Shalwar Qameez Complete',
    ),
  ];
}
