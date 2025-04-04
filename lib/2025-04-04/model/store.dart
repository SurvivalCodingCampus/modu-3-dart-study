import 'package:modu_3_dart_study/2025-04-04/model/enum/remain_stat.dart';

class Store {
  String addr;
  String code;
  DateTime createdAt;
  double lat;
  double lng;
  String name;
  RemainStat remainStat;
  DateTime stockAt;
  String type;

  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Store && runtimeType == other.runtimeType &&
              addr == other.addr && code == other.code &&
              createdAt == other.createdAt && lat == other.lat &&
              lng == other.lng && name == other.name &&
              remainStat == other.remainStat && stockAt == other.stockAt &&
              type == other.type;

  @override
  int get hashCode =>
      addr.hashCode ^ code.hashCode ^ createdAt.hashCode ^ lat.hashCode ^ lng
          .hashCode ^ name.hashCode ^ remainStat.hashCode ^ stockAt
          .hashCode ^ type.hashCode;

  @override
  String toString() {
    return 'Store{addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type}';
  }

  Store copyWith({
    String? addr,
    String? code,
    DateTime? createdAt,
    double? lat,
    double? lng,
    String? name,
    RemainStat? remainStat,
    DateTime? stockAt,
    String? type,
  }) {
    return Store(
      addr: addr ?? this.addr,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      remainStat: remainStat ?? this.remainStat,
      stockAt: stockAt ?? this.stockAt,
      type: type ?? this.type,
    );
  }
}
