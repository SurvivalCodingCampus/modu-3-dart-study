import '../index.dart';

// 컴퓨터
class Computer extends TangibleAsset {
  static const double taxRate = 0.15;

  // 출판사 이름
  String makerName;
  double _weight;

  Computer({
    required this.makerName,
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
        return price * 0.8;
      case < 90:
        return price * 0.7;
      default:
        return price * 0.5;
    }
  }
}
