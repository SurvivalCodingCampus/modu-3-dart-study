import 'package:modu_3_dart_study/2025-03-19/index.dart';

// 유형 자산
abstract class TangibleAsset extends Asset implements Thing {
  static const double taxRate = 0.1;

  // 가격
  int price;

  // 색상
  String color;

  // 구매 일자
  DateTime purchaseDate;

  TangibleAsset(
    this.price,
    this.color,
    this.purchaseDate,
    super.name,
    super.createdDate,
    super.manageDepart,
    super.description,
  );

  @override
  int calculateTax() {
    return (price * taxRate).toInt();
  }

  // 감가상각 계산
  double depreAndAmort();
}
