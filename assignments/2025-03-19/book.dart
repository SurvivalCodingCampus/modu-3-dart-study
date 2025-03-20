import 'tangible_asset.dart';

class Book extends TangibleAsset {
  String isbn;

  Book({
    required this.isbn,
    required super.price,
    required super.color,
    required super.purchaseDate,
    required super.salvageValue,
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
    super.weight
  });

  @override
  double weight = 100.0;

  @override
  int calculateTax() {
    return (price * 0.05).toInt();
  }
}