import 'package:intl/intl.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/remain_status.dart';

class InventoryDto {
  String? addr;
  String? code;
  DateTime? createdAt;
  double? lat;
  double? lng;
  String? name;
  RemainStatus? remainStatus;
  DateTime? stockAt;
  String? type;

  InventoryDto({
    this.lat,
    this.lng,
    this.name,
    this.remainStatus,
    this.addr,
    this.code,
    this.createdAt,
    this.stockAt,
    this.type,
  });

  factory InventoryDto.fromJson(Map<String, dynamic> json) {
    final DateFormat format = DateFormat("yyyy/MM/dd HH:mm:ss");

    return InventoryDto(
      addr: json['addr'] ?? null,
      code: json['code'] ?? null,
      createdAt:
          json['created_at'] != null ? format.parse(json['created_at']) : null,
      lat: json['lat'] ?? null,
      lng: json['lng'] ?? null,
      name: json['name'] ?? null,
      remainStatus:
          json['remain_stat'] != null
              ? RemainStatus.fromName(json['remain_stat'] as String)
              : null,
      stockAt: json['stock_at'] != null ? format.parse(json['stock_at']) : null,
      type: json['type'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'createdAt': createdAt?.toIso8601String(),
      'lat': lat,
      'lng': lng,
      'name': name,
      'remainStatus': remainStatus?.toJson(),
      'stockAt': stockAt?.toIso8601String(),
      'type': type,
    };
  }

  @override
  String toString() {
    return 'InventoryDto{addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStatus: $remainStatus, stockAt: $stockAt, type: $type}';
  }
}
