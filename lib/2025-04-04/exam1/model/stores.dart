import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stores.freezed.dart';

@freezed
class Stores with _$Stores {
  final String addr;
  final String code;
  final DateTime createdAt;
  final num lat;
  final num lng;
  final String name;
  final String remainState;
  final DateTime stockAt;
  final String type;

  const Stores({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainState,
    required this.stockAt,
    required this.type,
  });
}