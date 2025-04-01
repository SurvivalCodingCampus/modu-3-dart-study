abstract class Asset {
  final String _name;
  int _price;

  Asset({required String name, required int price})
    : _name = name,
      _price = price < 0 ? 0 : price;

  String get name => _name;
  int get price => _price;

  set price(int value) => _price = value < 0 ? 0 : value;
}
