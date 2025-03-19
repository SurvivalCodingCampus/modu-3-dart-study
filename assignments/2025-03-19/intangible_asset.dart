import 'asset.dart';

abstract class IntangibleAsset extends Asset {
  IntangibleAsset({
    required super.name,
    required super.createdDate,
    required super.manageDepart,
    required super.description,
  });

  @override
  void dispose() {
    print("처분 완료");
  }

  @override
  void transact() {
    print("거래 완료");
  }
}