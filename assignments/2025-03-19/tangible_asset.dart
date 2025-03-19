import 'asset.dart';
import 'thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  int price;
  String color;
  DateTime purchaseDate;
  double salvageValue; // 잔존가치

  TangibleAsset({
    required this.price,
    required this.color,
    required this.purchaseDate,
    required this.salvageValue,
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
    double weight = 0.0,
  });

  double calculateDepreciation(int years) {
    if (years <= 0) return 0.0; // 음수 방지
    return (price - salvageValue) / years;
  }

  @override
  void dispose() {
    print("처분 완료");
  }

  @override
  void transact() {
    print("거래 완료");
  }
}