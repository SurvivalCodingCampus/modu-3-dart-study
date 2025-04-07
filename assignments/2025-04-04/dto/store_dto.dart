class StoreDto {
  final String? addr;
  final String? code;
  final String? created_at;
  final num? lat;
  final num? lng;
  final String? name;
  final String? remain_stat;
  final String? stock_at;
  final String? type;

  const StoreDto({
    this.addr,
    this.code,
    this.created_at,
    this.lat,
    this.lng,
    this.name,
    this.remain_stat,
    this.stock_at,
    this.type,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) {
    return StoreDto(
      addr: json['addr'],
      code: json['code'],
      created_at: json['created_at'],
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      remain_stat: json['remain_stat'],
      stock_at: json['stock_at'],
      type: json['type'],
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
}
