class MaskDto {
  String? addr;
  String? code; // <-- String으로 변경
  DateTime? createdAt;
  num? lat;
  num? lng;
  String? name;
  String? remainStat;
  DateTime? stockAt;
  String? type; // <-- String으로 변경

  MaskDto({
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

  MaskDto.fromJson(Map<String, dynamic> json) {
    addr = json['addr'];
    code = json['code']?.toString(); // <-- toString()으로 안전하게 변환
    createdAt = json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null;
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    remainStat = json['remain_stat'];
    stockAt = json['stock_at'] != null ? DateTime.tryParse(json['stock_at']) : null;
    type = json['type']?.toString(); // <-- toString()으로 안전하게 변환
  }

  Map<String, dynamic> toJson() {
    return {
      'addr': addr,
      'code': code,
      'created_at': createdAt?.toIso8601String(),
      'lat': lat,
      'lng': lng,
      'name': name,
      'remain_stat': remainStat,
      'stock_at': stockAt?.toIso8601String(),
      'type': type,
    };
  }
}