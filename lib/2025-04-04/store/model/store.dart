import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  final String addr;
  final String code;
  final DateTime createdAt;
  final String name;
  final String remainStat;
  final DateTime stockAt;
  final String type;

  const Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });
}
