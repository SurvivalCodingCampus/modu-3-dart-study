import '../index.dart';

// 책
class Book extends TangibleAsset {
  static const double taxRate = 0.11;

  // 책 관리 코드
  String isbn;
  double _weight;

  Book({
    required this.isbn,
    required double weight,
    required int price,
    required String color,
    required DateTime purchaseDate,
    required String name,
    required DateTime createdDate,
    required String manageDepart,
    required String description,
  }) : _weight = weight,
       super(
         price,
         color,
         purchaseDate,
         name,
         createdDate,
         manageDepart,
         description,
       );

  @override
  double get weight => _weight;

  @override
  set weight(double value) {
    _weight = value;
  }

  @override
  int calculateTax() {
    final tangibleAssetTax = super.calculateTax();
    return (price * taxRate).toInt() + tangibleAssetTax;
  }

  @override
  double depreAndAmort() {
    final currentDate = DateTime.now();
    final differentDays = currentDate.difference(createdDate).inDays;

    switch (differentDays) {
      case <= 30:
        return price * 0.9;
      case < 90:
        return price * 0.8;
      default:
        return price * 0.7;
    }
  }
}

main() {}
