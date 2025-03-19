import 'asset.dart';

abstract class IntangibleAsset extends Asset {
  String owner;

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.owner,
  });
}
