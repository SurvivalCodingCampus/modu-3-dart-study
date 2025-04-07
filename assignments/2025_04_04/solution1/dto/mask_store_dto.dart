class MaskStoreDto {
  String? addr;
  String? code;
  String? createdAt;
  num? lat;
  num? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;

  MaskStoreDto({
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

  factory MaskStoreDto.fromJson(Map<String, dynamic> json) {
    return MaskStoreDto(
      addr: json['addr'],
      code: json['code'],
      createdAt: json['created_at'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      remainStat: json['remain_stat'],
      stockAt: json['stock_at'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
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

  @override
  String toString() {
    return 'Dto(addr: $addr, code: $code, created_at: $createdAt, lat: $lat, lng: $lng, name: $name, remain_stat: $remainStat, stock_at: $stockAt, type: $type)';
  }
}
