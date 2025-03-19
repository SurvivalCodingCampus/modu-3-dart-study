import 'package:modu_3_dart_study/2025-03-19/intangible_asset.dart';

class Trademark extends IntangibleAsset {
  final String _owner;

  Trademark({required super.name, required super.price, required String owner})
    : _owner = owner;

  String get owner => _owner;
}
