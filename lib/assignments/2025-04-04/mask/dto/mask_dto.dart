import 'dart:convert';

import 'package:collection/collection.dart';

class MaskDto {
  final int count;
  final List<Store> stores;
  MaskDto({required this.count, required this.stores});

  MaskDto copyWith({int? count, List<Store>? stores}) {
    return MaskDto(count: count ?? this.count, stores: stores ?? this.stores);
  }

  Map<String, dynamic> toJson() {
    return {'count': count, 'stores': stores.map((x) => x.toJson()).toList()};
  }

  factory MaskDto.fromJson(Map<String, dynamic> map) {
    return MaskDto(
      count: map['count']?.toInt() ?? 0,
      stores: List<Store>.from(map['stores']?.map((x) => Store.fromJson(x))),
    );
  }

  @override
  String toString() => 'MaskDto(count: $count, stores: $stores)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is MaskDto &&
        other.count == count &&
        listEquals(other.stores, stores);
  }

  @override
  int get hashCode => count.hashCode ^ stores.hashCode;
}

class Store {
  final String? addr;
  final String? code;
  final String? created_at;
  final double? lat;
  final double? lng;
  final String name;
  final String? remain_stat;
  final String? stock_at;
  final String? type;
  Store({
    required this.addr,
    required this.code,
    required this.created_at,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remain_stat,
    required this.stock_at,
    required this.type,
  });

  Store copyWith({
    String? addr,
    String? code,
    String? created_at,
    double? lat,
    double? lng,
    String? name,
    String? remain_stat,
    String? stock_at,
    String? type,
  }) {
    return Store(
      addr: addr ?? this.addr,
      code: code ?? this.code,
      created_at: created_at ?? this.created_at,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      name: name ?? this.name,
      remain_stat: remain_stat ?? this.remain_stat,
      stock_at: stock_at ?? this.stock_at,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'created_at': created_at,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remain_stat,
      'stock_at': stock_at,
      'type': type,
    };
  }

  factory Store.fromJson(Map<String, dynamic> map) {
    return Store(
      addr: map['addr'] ?? '',
      code: map['code'] ?? '',
      created_at: map['created_at'] ?? '',
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      remain_stat: map['remain_stat'] ?? '',
      stock_at: map['stock_at'] ?? '',
      type: map['type'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Store(addr: $addr, code: $code, created_at: $created_at, lat: $lat, lng: $lng, name: $name, remain_stat: $remain_stat, stock_at: $stock_at, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Store &&
        other.addr == addr &&
        other.code == code &&
        other.created_at == created_at &&
        other.lat == lat &&
        other.lng == lng &&
        other.name == name &&
        other.remain_stat == remain_stat &&
        other.stock_at == stock_at &&
        other.type == type;
  }

  @override
  int get hashCode {
    return addr.hashCode ^
        code.hashCode ^
        created_at.hashCode ^
        lat.hashCode ^
        lng.hashCode ^
        name.hashCode ^
        remain_stat.hashCode ^
        stock_at.hashCode ^
        type.hashCode;
  }
}
