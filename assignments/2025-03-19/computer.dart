import 'tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;
  double _weight;

  Computer({
    required this.makerName,
    required super.name,
    required super.price,
    required super.color,
    required super.purchaseDate,
    required super.salvageValue,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
    required double weight,
  }) : _weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double value) => _weight = value;

  @override
  int calculateTax() {
    return (price * 0.1).toInt();
  }
}