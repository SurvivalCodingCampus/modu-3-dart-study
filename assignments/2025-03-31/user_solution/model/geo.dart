import 'dart:convert';

class Geo {
  double lat;
  double lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> map) {
    return Geo(
      lat: double.parse(map['lat']), // 문자열을 double로 변환
      lng: double.parse(map['lng']), // 문자열을 double로 변환
    );
  }

  @override
  String toString() => 'Geo(lat: $lat, lng: $lng)';
}
