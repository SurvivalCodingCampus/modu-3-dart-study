import 'package:modu_3_dart_study/2025-03/2025-03-19/tangible_asset.dart';

class Computer extends TangibleAsset {
  final String _makerName;

  Computer({
    required super.name,
    required super.price,
    required super.color,
    required String makerName,
  }) : _makerName = makerName;

  String get makerName => _makerName;
}
