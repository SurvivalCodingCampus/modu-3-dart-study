class Geo {
  final double lat;
  final double lng;

  const Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> map) {
    return Geo(
      lat: double.parse(map['lat']), // 문자열을 double로 변환
      lng: double.parse(map['lng']), // 문자열을 double로 변환
    );
  }

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';

  Geo copyWith({double? lat, double? lng}) {
    return Geo(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geo && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'lat': lat});
    result.addAll({'lng': lng});

    return result;
  }
}
