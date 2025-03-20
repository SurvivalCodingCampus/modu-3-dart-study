import 'asset.dart';

abstract class IntangibleAsset extends Asset {
  String owner;
  String registrationNumber;

  IntangibleAsset({
    required super.name,
    required super.price,
    required this.owner,
    required this.registrationNumber,
  });
}
