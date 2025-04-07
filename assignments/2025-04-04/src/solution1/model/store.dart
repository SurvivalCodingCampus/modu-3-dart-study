import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
class Store with _$Store {
  final String name;
  final String code;
  final String createAt;
  final String stockAt;
  final String remainStat;

  const Store({
    required this.name,
    required this.code,
    required this.createAt,
    required this.stockAt,
    required this.remainStat,
  });
}