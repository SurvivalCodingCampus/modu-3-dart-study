// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'store_remain_stat.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Store with _$Store {
  final String addr;
  final int code;
  final DateTime? createdAt;
  final double lat;
  final double lng;
  final String name;
  final StoreRemainStat? remainStat;
  final DateTime? stockAt;
  final String type;
  Store({
    required this.addr,
    required this.code,
    this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
