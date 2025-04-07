class StoreDto {
  final String? addr;
  final String? code;
  final String? createdAt;
  final double? lat;
  final double? lng;
  final String? name;
  final String? remainStat;
  final String? stockAt;
  final String? type;

  StoreDto({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) {
    return StoreDto(
      addr: json['addr'] as String?,
      code: json['code'] as String?,
      createdAt: json['created_at'] as String?,
      lat: json['lat'] as double?,
      lng: json['lng'] as double?,
      name: json['name'] as String?,
      remainStat: json['remain_stat'] as String?,
      stockAt: json['stock_at'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'created_at': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStat,
      'stock_at': stockAt,
      'type': type,
    };
  }
}

class StoreListDTO {
  final int? count;
  final List<StoreDto>? stores;

  StoreListDTO({this.count, this.stores});

  factory StoreListDTO.fromJson(Map<String, dynamic> json) {
    return StoreListDTO(
      count: json['count'] as int?,
      stores:
          (json['stores'] as List<dynamic>?)
              ?.map((item) => StoreDto.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'stores': stores?.map((store) => store.toJson()).toList(),
    };
  }
}
