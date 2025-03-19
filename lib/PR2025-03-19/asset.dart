import 'package:modu_3_dart_study/PR2025-03-19/tangibleAsset.dart';

abstract class Asset {
  int amount;

  Asset({required this.amount});

  //할인하는 메서드 생성
  int getDiscount(int price) {
    int discountPrice = (price * 0.9).toInt();
    return discountPrice;
  }
}
